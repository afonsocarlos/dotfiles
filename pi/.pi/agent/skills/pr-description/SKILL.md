---
name: pr-description
description: Generates a succinct, straight-to-the-point PR description summarizing all changes in the current working branch compared to the main branch. Use when asked to write, draft, or generate a pull request (PR) description, PR summary, or changelog for the current branch.
---

# PR Description Generator

Generates a concise pull request description from the diff between the current branch and the repository's main branch.

## Steps

1. **Detect the base branch.** Try, in order, `main`, `master`, `develop`, `preprod`. Confirm it exists:

   ```bash
   git rev-parse --verify main 2>/dev/null || git rev-parse --verify master 2>/dev/null || git rev-parse --verify develop 2>/dev/null || git rev-parse --verify preprod 2>/dev/null
   ```

   If none exist locally, check remote branches (`git branch -r`) and use the remote-tracking equivalent (e.g. `origin/main`).

2. **Detect the current branch:**

   ```bash
   git rev-parse --abbrev-ref HEAD
   ```

   If the current branch IS the base branch, stop and tell the user there's nothing to compare (they're on the base branch).

3. **Get the merge-base** to diff only against branch-specific changes, not unrelated upstream history:

   ```bash
   git merge-base main HEAD
   ```

4. **Gather the changes:**

   ```bash
   git log --oneline <merge-base>..HEAD
   git diff --stat <merge-base>..HEAD
   git diff <merge-base>..HEAD
   ```

   Use the full diff (not just stat) to understand *what* changed, not just *which files*. If the diff is very large, rely more on file stats + commit messages + targeted reads of key files rather than dumping the entire diff into context.

5. **Analyze and group changes** by logical concern, not by file. Look for:
   - New features / behavior added
   - Bug fixes
   - Refactors (no behavior change)
   - Tests added/updated
   - Migrations / schema changes
   - Config, dependency, or tooling changes
   - Breaking changes or things reviewers must pay special attention to

6. **Write the PR description.** Keep it short and scannable — no fluff, no restating the obvious, no narrating the diff line by line. Prefer bullet points over prose paragraphs.

## Output Format

Produce Markdown in this shape (omit empty sections):

```markdown
## Summary
<1-3 sentence description of what this PR does and why, if inferable from commits/code>

## Changes
- <bullet per logical change, most important first>
- ...

## Notes
- <only if relevant: breaking changes, migration steps, follow-ups, things to double check>
```

Rules:
- No filler like "This PR introduces changes that..." — start directly with the substance.
- Do not list every touched file; group by intent/feature area instead.
- Do not include a "Testing" section unless test changes are notable or the user asks for it.
- If commit messages already clearly describe the intent, use them as a source but rewrite for clarity — don't just paste the commit log.
- If the diff is empty (branch == base after merge-base), say so plainly instead of inventing content.
