local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  tools = {
    autoSetHints = false,
    inlay_hints = {
      auto = false,
      -- prefix for parameter hints
      parameter_hints_prefix = "<-",

      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=>",
    },
  },
}

return options
