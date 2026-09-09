/**
 * Live per-million-token pricing while browsing pi's model selector.
 *
 * This does NOT reimplement or replace pi's model selector UI. It reuses the
 * exact `ModelSelectorComponent` pi ships (imported directly from
 * `@earendil-works/pi-coding-agent`) and wraps it with a single extra line
 * that shows pricing for whichever model is currently highlighted. All
 * searching, filtering, scrolling, scope toggling, and catalog refresh
 * behavior stays fully owned by pi's own component, so future improvements
 * to that component keep working automatically without any change here.
 *
 * The editor wrapper intercepts pi's existing `app.model.select` action, so
 * the configured model-selection key (Ctrl+L by default, including custom
 * keybindings) opens the priced selector. It also routes `/model` through the
 * same selector. No footer status or extra price command is registered.
 *
 * Figuring out which row is highlighted reads two non-public
 * `ModelSelectorComponent` fields (`filteredModels`, `selectedIndex`). This is
 * read-only introspection, guarded defensively: if a future pi release renames
 * these fields, the price line just stops updating instead of breaking model
 * selection itself.
 */

import type { Model } from "@earendil-works/pi-ai";
import {
    CustomEditor,
    ModelSelectorComponent,
    type ExtensionAPI,
    type ExtensionContext,
} from "@earendil-works/pi-coding-agent";
import { Container, type Focusable, Spacer, Text, type TUI } from "@earendil-works/pi-tui";

type CostTier = {
    inputTokensAbove: number;
    input: number;
    output: number;
    cacheRead: number;
    cacheWrite: number;
};

type ModelCost = {
    input: number;
    output: number;
    cacheRead: number;
    cacheWrite: number;
    tiers?: readonly CostTier[];
};

type ModelWithCost = Model<any> & { cost?: ModelCost };

function formatUsd(value: number): string {
    if (!Number.isFinite(value)) return "n/a";
    if (value === 0) return "$0";

    // Keep small per-token rates readable (e.g. $0.0003) without scientific
    // notation or unnecessary trailing zeroes.
    const decimals = Math.abs(value) >= 1 ? 2 : 6;
    return `$${value.toFixed(decimals).replace(/\.?0+$/, "")}`;
}

function formatPriceLine(model: ModelWithCost | undefined): string {
    if (!model) return "";

    const cost = model.cost;
    if (!cost) return `${model.provider}/${model.id}: pricing unavailable`;

    return (
        `${model.provider}/${model.id} — ` +
            `${formatUsd(cost.input)} in · ${formatUsd(cost.output)} out · ` +
            `${formatUsd(cost.cacheRead)} cache read · ${formatUsd(cost.cacheWrite)} cache write (per 1M tokens)`
    );
}

/** Non-public shape we defensively peek at to find the highlighted row. */
interface PeekableSelector {
    filteredModels?: Array<{ provider: string; id: string; model: ModelWithCost }>;
    selectedIndex?: number;
}

function getHighlightedModel(selector: ModelSelectorComponent): ModelWithCost | undefined {
    const peek = selector as unknown as PeekableSelector;
    const list = peek.filteredModels;
    const idx = peek.selectedIndex;
    if (!Array.isArray(list) || typeof idx !== "number") return undefined;
    return list[idx]?.model;
}

/** Non-public shape we defensively peek at to reach the shared ModelRuntime. */
interface RuntimeHolder {
    runtime?: ConstructorParameters<typeof ModelSelectorComponent>[2];
}

function getModelRuntime(ctx: ExtensionContext): ConstructorParameters<typeof ModelSelectorComponent>[2] | undefined {
    return (ctx.modelRegistry as unknown as RuntimeHolder).runtime;
}

/**
 * Thin wrapper: renders pi's real ModelSelectorComponent unchanged, plus one
 * extra line showing pricing for the currently highlighted model.
 */
class PricedModelSelector extends Container implements Focusable {
    private readonly inner: ModelSelectorComponent;
    private readonly priceLine: Text;
    private readonly tui: TUI;

    private _focused = false;
    get focused(): boolean {
        return this._focused;
    }
    set focused(value: boolean) {
        this._focused = value;
        (this.inner as unknown as Focusable).focused = value;
    }

    constructor(tui: TUI, inner: ModelSelectorComponent) {
        super();
        this.tui = tui;
        this.inner = inner;
        this.priceLine = new Text("", 1, 0);

        this.addChild(inner);
        this.addChild(new Spacer(1));
        this.addChild(this.priceLine);

        this.refreshPriceLine();
    }

    handleInput(data: string): void {
        this.inner.handleInput(data);
        this.refreshPriceLine();
        this.tui.requestRender();
    }

    dispose(): void {
        this.inner.dispose();
    }

    private refreshPriceLine(): void {
        this.priceLine.setText(formatPriceLine(getHighlightedModel(this.inner)));
    }
}

type OpenModelSelector = (ctx: ExtensionContext, initialSearchInput?: string) => Promise<void>;

class ModelCommandEditor extends CustomEditor {
    private readonly isModelSelectKey: (data: string) => boolean;
    private readonly isSubmitKey: (data: string) => boolean;
    private readonly openModelSelector: (initialSearchInput?: string) => void;

    constructor(
        tui: ConstructorParameters<typeof CustomEditor>[0],
        theme: ConstructorParameters<typeof CustomEditor>[1],
        keybindings: ConstructorParameters<typeof CustomEditor>[2],
        isModelSelectKey: (data: string) => boolean,
        isSubmitKey: (data: string) => boolean,
        openModelSelector: (initialSearchInput?: string) => void,
    ) {
        super(tui, theme, keybindings);
        this.isModelSelectKey = isModelSelectKey;
        this.isSubmitKey = isSubmitKey;
        this.openModelSelector = openModelSelector;
    }

    handleInput(data: string): void {
        if (this.isModelSelectKey(data)) {
            this.openModelSelector();
            return;
        }

        if (this.isSubmitKey(data)) {
            const text = this.getText().trim();
            if (text === "/model" || text.startsWith("/model ")) {
                const searchTerm = text.slice("/model".length).trim() || undefined;
                this.setText("");
                this.openModelSelector(searchTerm);
                return;
            }
        }

        super.handleInput(data);
    }
}

export default function(pi: ExtensionAPI) {
    const openModelSelector: OpenModelSelector = async (ctx, initialSearchInput) => {
        if (ctx.mode !== "tui") return;

        const runtime = getModelRuntime(ctx);
        if (!runtime) {
            ctx.ui.notify("Priced model selector is unavailable in this mode.", "warning");
            return;
        }

        try {
            await ctx.ui.custom<void>((tui, _theme, _keybindings, done) => {
                const inner = new ModelSelectorComponent(
                    tui,
                    ctx.model,
                    runtime,
                    ctx.scopedModels,
                    (model) => {
                        void (async () => {
                            try {
                                const ok = await pi.setModel(model);
                                if (!ok) {
                                    ctx.ui.notify(
                                        `No credentials configured for ${model.provider}/${model.id}.`,
                                        "error",
                                    );
                                }
                            } finally {
                                done();
                            }
                        })();
                    },
                    () => done(),
                    initialSearchInput,
                );
                return new PricedModelSelector(tui, inner);
            });
        } catch (error) {
            ctx.ui.notify(
                `Priced model selector failed: ${error instanceof Error ? error.message : String(error)}`,
                "error",
            );
        }
    };

    pi.on("session_start", (_event, ctx) => {
        if (ctx.mode !== "tui") return;

        ctx.ui.setEditorComponent((tui, theme, keybindings) =>
            new ModelCommandEditor(
                tui,
                theme,
                keybindings,
                (data) => keybindings.matches(data, "app.model.select"),
                (data) => keybindings.matches(data, "tui.input.submit"),
                (initialSearchInput) => {
                    void openModelSelector(ctx, initialSearchInput);
                },
            ),
        );
    });
}
