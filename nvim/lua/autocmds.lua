require "nvchad.autocmds"

vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  callback = function()
    package.loaded["themes.matugen"] = nil
    require("base46").load_all_highlights()
  end,
})

