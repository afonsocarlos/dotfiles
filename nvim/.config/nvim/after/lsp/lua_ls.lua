return {
  Lua = {
    completion = {
      callSnippet = "Replace",
    },
    diagnostics = {
      globals = { "vim" },
    },
    format = { enable = true },
    telemetry = { enable = false },
    workspace = { checkThirdParty = true },
  },
}

