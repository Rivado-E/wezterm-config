local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.keys = {
	{
		key = "Return",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
	{
		key = "e",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

-- config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "Hacktober"
-- config.color_scheme = "Highway"
-- config.color_scheme = "Hybrid (terminal.sexy)"
-- config.color_scheme = "Catppuccin Frappe"
-- config.color_scheme = "Vacuous 2 (terminal.sexy)"
-- config.color_scheme = "Colors (base16)"
-- config.color_scheme = "Grayscale Dark (base16)"
-- config.color_scheme = "Grayscale (dark) (terminal.sexy)"

config.adjust_window_size_when_changing_font_size = false
config.colors = {

	foreground = "silver",
	-- background = "black",
	cursor_fg = "black",
	cursor_border = "#52ad70",
	selection_fg = "black",
	selection_bg = "#fffacd",
	scrollbar_thumb = "#222222",
	split = "#444444",
}

-- "JetBrains Mono",
-- config.window_background_opacity = 0.69 + 0.0420 + 0.18 --[[ + 0.13 ]]
config.font_size = 18
config.cursor_thickness = "4px"
config.font = wezterm.font_with_fallback({
	"IosevkaTerm Nerd Font",
})

config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.window_padding = {
	left = 3,
	right = 3,
	top = 3,
	bottom = 3,
}
config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"

return config
