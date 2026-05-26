-- Load NvChad's LSP defaults (keymaps, diagnostics, global capabilities)
require("nvchad.configs.lspconfig").defaults()

-- Servers with default config (no extra settings needed)
-- NvChad's defaults() already sets capabilities, on_init, and on_attach for all servers via:
--   vim.lsp.config("*", { capabilities = ..., on_init = ... })
--   LspAttach autocmd for on_attach
local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- For servers that need custom settings, use:
-- vim.lsp.config("server_name", { settings = { ... } })
-- vim.lsp.enable("server_name")
