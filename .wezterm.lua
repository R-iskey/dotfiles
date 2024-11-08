-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Tokyo Night"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- my coolnight colorscheme:
-- config.colors = {
-- 	foreground = "#CBE0F0",
-- 	background = "#011423",
-- 	cursor_bg = "#47FF9C",
-- 	cursor_border = "#47FF9C",
-- 	cursor_fg = "#011423",
-- 	selection_bg = "#033259",
-- 	selection_fg = "#CBE0F0",
-- 	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
-- 	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
-- }


-- config.window_background_gradient = {
--  colors = { '#EEBD89', '#D13ABD' },
--  orientation = { Linear = { angle = -45.0 } },
-- }

config.keys = {
	{ key = 'k', mods = 'CMD', action = act.ClearScrollback 'ScrollbackAndViewport'},
	{ mods = "OPT", key = "LeftArrow", action = act.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = act.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = act.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = act.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = act.SendKey({ mods = "CTRL", key = "u" }) },
	{ mods = "CMD|OPT", key = "LeftArrow", action = act.ActivateTabRelative(-1) },
	{ mods = "CMD|OPT", key = "RightArrow", action = act.ActivateTabRelative(1) },
	{ mods = "CMD|SHIFT", key = "LeftArrow", action = act.ActivateTabRelative(-1) },
	{ mods = "CMD|SHIFT", key = "RightArrow", action = act.ActivateTabRelative(1) },
	{ mods = "CMD", key = "d", action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
	{ mods = "CMD", key = "a", action = act.SplitVertical({ domain = 'CurrentPaneDomain'  }) },
	{
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}


-- and finally, return the configuration to wezterm
return config
