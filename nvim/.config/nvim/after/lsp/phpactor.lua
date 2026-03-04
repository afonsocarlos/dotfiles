return {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  on_attach = function(client, bufnr)
    client.server_capabilities.completionProvider = false
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.implementationProvider = false
    client.server_capabilities.referencesProvider = false
    client.server_capabilities.renameProvider = false
    client.server_capabilities.selectionRangeProvider = false
    client.server_capabilities.signatureHelpProvider = false
    client.server_capabilities.typeDefinitionProvider = false
    client.server_capabilities.workspaceSymbolProvider = false
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.documentHighlightProvider = false
    client.server_capabilities.documentSymbolProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local setup_inlay = vim.api.nvim_create_augroup("setup_inlay", { clear = true })
    vim.api.nvim_create_autocmd("InsertEnter", {
      group = setup_inlay,
      buffer = bufnr,
      callback = function() vim.lsp.inlay_hint.enable(true, { bufnr = bufnr }) end,
    })
    vim.api.nvim_create_autocmd("InsertLeave", {
      group = setup_inlay,
      buffer = bufnr,
      callback = function() vim.lsp.inlay_hint.enable(false, { bufnr = bufnr }) end,
    })
  end,
  init_options = {
    ["language_server_worse_reflection.inlay_hints.enable"] = true,
  },
}
