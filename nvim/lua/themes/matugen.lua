-- Matugen Material You theme for NvChad/base46
-- Reads colors from ~/.config/matugen/generated/neovim-colors.lua

local colors_path = vim.fn.expand "~/.config/matugen/generated/neovim-colors.lua"

-- Load generated colors, fall back to defaults if file is missing
local ok, c = pcall(dofile, colors_path)
if not ok then
  vim.schedule(function()
    vim.notify("matugen: colors not found – run 'matugen' first", vim.log.levels.WARN)
  end)
  -- Minimal fallback so the theme still loads
  c = {
    primary = "#82d3e2",
    on_primary = "#003640",
    primary_container = "#004e59",
    on_primary_container = "#9ef0ff",
    secondary = "#b1cbd0",
    on_secondary = "#1c3438",
    secondary_container = "#334b4f",
    on_secondary_container = "#cce7ec",
    tertiary = "#bbc5ea",
    on_tertiary = "#253060",
    tertiary_container = "#3c4665",
    on_tertiary_container = "#dbe1ff",
    error = "#ffb4ab",
    on_error = "#690005",
    error_container = "#93000a",
    on_error_container = "#ffdad5",
    background = "#0e1416",
    on_background = "#dee3e5",
    surface = "#0e1416",
    on_surface = "#dee3e5",
    surface_variant = "#3f484a",
    on_surface_variant = "#bfc8ca",
    surface_container = "#1a2022",
    surface_container_low = "#171d1e",
    surface_container_high = "#252b2c",
    surface_container_highest = "#303637",
    surface_container_lowest = "#090f10",
    surface_bright = "#343a3c",
    outline = "#899294",
    outline_variant = "#3f484a",
    inverse_surface = "#dee3e5",
    inverse_on_surface = "#2b3133",
    inverse_primary = "#006875",
    shadow = "#000000",
    scrim = "#000000",
  }
end

-- Auto-detect dark / light from background luminance
local function is_dark(hex)
  if not hex or #hex < 7 then
    return true
  end
  local r = tonumber(hex:sub(2, 3), 16) or 0
  local g = tonumber(hex:sub(4, 5), 16) or 0
  local b = tonumber(hex:sub(6, 7), 16) or 0
  return (0.299 * r + 0.587 * g + 0.114 * b) / 255 < 0.5
end

local M = {}

---------------------------------------------------------------------------
-- base_30  –  UI chrome (statusline, tabufline, nvimtree, telescope …)
---------------------------------------------------------------------------
M.base_30 = {
  white = c.on_surface,
  darker_black = c.surface_container_lowest,
  black = c.background, -- nvim bg
  black2 = c.surface_container_low,
  one_bg = c.surface_container,
  one_bg2 = c.surface_container_high,
  one_bg3 = c.surface_container_highest,
  grey = c.outline_variant,
  grey_fg = c.outline,
  grey_fg2 = c.on_surface_variant,
  light_grey = c.on_surface_variant,
  red = c.error,
  baby_pink = c.on_error_container,
  pink = c.tertiary,
  line = c.surface_container,
  green = c.primary,
  vibrant_green = c.on_primary_container,
  nord_blue = c.secondary,
  blue = c.primary,
  yellow = c.tertiary,
  sun = c.on_tertiary_container,
  purple = c.on_secondary_container,
  dark_purple = c.secondary,
  teal = c.primary,
  orange = c.on_tertiary_container,
  cyan = c.on_primary_container,
  statusline_bg = c.surface_container_low,
  lightbg = c.surface_container_high,
  pmenu_bg = c.primary,
  folder_bg = c.primary,
}

---------------------------------------------------------------------------
-- base_16  –  syntax highlights (base16 convention)
---------------------------------------------------------------------------
M.base_16 = {
  base00 = c.background,                -- Default Background
  base01 = c.surface_container_low,     -- Lighter Background
  base02 = c.surface_container,         -- Selection Background
  base03 = c.outline_variant,           -- Comments, Invisibles
  base04 = c.outline,                   -- Dark Foreground
  base05 = c.on_surface,               -- Default Foreground
  base06 = c.on_background,            -- Light Foreground
  base07 = c.surface_container_highest, -- Light Background
  base08 = c.error,                     -- Variables, Errors
  base09 = c.tertiary,                 -- Integers, Booleans, Constants
  base0A = c.secondary,                -- Classes, Types, Search
  base0B = c.primary,                  -- Strings
  base0C = c.on_secondary_container,   -- Regex, Escape Characters
  base0D = c.on_primary_container,     -- Functions, Methods
  base0E = c.on_tertiary_container,    -- Keywords, Storage
  base0F = c.on_error_container,       -- Deprecated, Tags
}

M.type = is_dark(c.background) and "dark" or "light"

---------------------------------------------------------------------------
-- polish_hl  –  fine-tune specific treesitter / default groups
---------------------------------------------------------------------------
M.polish_hl = {
  defaults = {
    Comment = { fg = c.outline },
  },
  treesitter = {
    ["@variable.parameter"] = { fg = c.tertiary },
    ["@attribute"] = { fg = c.secondary },
  },
}

M = require("base46").override_theme(M, "matugen")

return M
