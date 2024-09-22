-- this line for types, by hovering and autocompletion (lsp required)
-- will help you understanding properties, fields, and what highlightings the color used for
---@type Base46Table
local M = {}
-- UI
M.base_30 = {
  white = "#edecee",
  black = "#15141b",        -- usually your theme bg
  darker_black = "#141319", -- 6% darker than black
  black2 = "#21202b",       -- 6% lighter than black
  one_bg = "#2a2836",       -- 10% lighter than black
  one_bg2 = "#353344",      -- 6% lighter than one_bg2
  one_bg3 = "#3f3d51",      -- 6% lighter than one_bg3
  grey = "#6d6d6d",         -- 40% lighter than black (the % here depends so choose the perfect grey!)
  grey_fg = "#7c7c7c",      -- 10% lighter than grey
  grey_fg2 = "#747474",     -- 5% lighter than grey
  light_grey = "#a7a7a7",
  red = "#ff6767",
  baby_pink = "#f694ff",
  pink = "#f694ff",
  line = "#343243", -- 15% lighter than black
  green = "#61ffca",
  vibrant_green = "#61ffca",
  nord_blue = "#82e2ff",
  blue = "#82e2ff",
  seablue = "#82e2ff",
  yellow = "#ffce8f", -- 8% lighter than yellow
  sun = "#ffca85",
  purple = "#a277ff",
  dark_purple = "#a277ff",
  teal = "#82e2ff",
  orange = "#ffca85",
  cyan = "#82e2ff",
  statusline_bg = "#2a2836",
  lightbg = "#353344",
  pmenu_bg = "#a7a7a7",
  folder_bg = "#edecee"
}

-- check https://github.com/chriskempson/base16/blob/master/styling.md for more info
M.base_16 = {
  base00 = "#15141b",
  base01 = "#525156",
  base02 = "#6d6d6d",
  base03 = "#6d6d6d",
  base04 = "#29263c",
  base05 = "#edecee",
  base06 = "#edecee",
  base07 = "#edecee",
  base08 = "#ffca85",
  base09 = "#FFCA85",
  base0A = "#FFCA85",
  base0B = "#61ffca",
  base0C = "#40cdf7",
  base0D = "#a277ff",
  base0E = "#a277ff",
  base0F = "#edecee"
}
-- ()

-- set the theme type whether is dark or light
M.type = "dark" -- "or light"

-- this will be later used for users to override your theme table from chadrc
M = require("base46").override_theme(M, "aura-dark")

return M
