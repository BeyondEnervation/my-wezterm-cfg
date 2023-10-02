-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- This is where you actually apply your config choices

-- Keybindings
config.keys = {}
for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab
	table.insert(config.keys, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end
-- Windows WSL
config.default_domain = 'WSL:Ubuntu'
-- Font
config.font = wezterm.font("DejaVuSansM Nerd Font Mono", { weight = "Regular", stretch = "Normal", style = "Normal" })

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox dark, hard (base16)"

-- and finally, return the configuration to wezterm
return config
