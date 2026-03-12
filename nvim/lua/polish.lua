return function()
  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "StatusLine",
    "StatusLineNC",
    "WinBar",
    "WinBarNC",
    "CursorLine",
    "CursorLineNr",
    "LineNr",
    "EndOfBuffer",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeWinSeparator",
    "TabLine",
    "TabLineFill",
    "TabLineSel",
    "Pmenu",
    "PmenuSel",
    "PmenuSbar",
    "PmenuThumb",
  }

  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
  end
end
