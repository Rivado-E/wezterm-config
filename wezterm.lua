-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.audible_bell = "Disabled"
config.keys = {
	{
		key = "Return",
		mods = "CMD",
		action = wezterm.action.ToggleFullScreen,
	},
}
-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = "Colors (base16)"
config.adjust_window_size_when_changing_font_size = false
-- Set background to same color as neovim
config.colors = {
	-- color_scheme takes precedence over these

	foreground = "silver", -- [silver] The default text color
	background = "black", -- [black]  The default background color
	cursor_bg = "#52ad70", -- [#52ad70] Overrides the cell background color when the current cell is occupied by the cursor and the cursor style is set to Block
	cursor_fg = "black", -- [black]   Overrides the text color when the current cell is occupied by the cursor
	cursor_border = "#52ad70", -- [#52ad70] Specifies the border color of the cursor when the cursor style is set to Block, of the color of the vertical or horizontal bar when the cursor style is set to Bar or Underline.
	selection_fg = "black", -- [black]   The foreground color of selected text
	selection_bg = "#fffacd", -- [#fffacd] The background color of selected text
	scrollbar_thumb = "#222222", -- [#222222] The color of the scrollbar "thumb"; the portion that represents the current viewport
	split = "#444444", -- [#444444] The color of the split lines between panes
	--   ansi        	= {"black", "maroon", "green", "olive", "navy", "purple", "teal", "silver"},
	--   brights     	= {"grey", "red", "lime", "yellow", "blue", "fuchsia", "aqua", "white"},
	--   indexed     	= {[136]="#af8700"} , -- Arbitrary colors of the palette in the range from 16 to 255
}

config.window_background_opacity = 0.98 -- [1.0] alpha channel value with floating point numbers in the range 0.0 (meaning completely translucent/transparent) through to 1.0 (meaning completely opaque)
config.colors.background = "#111111"
config.font_size = 13
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
})

-- default is true, has more "native" look
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"

-- I don't like putting anything at the ege if I can help it.
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"

-- and finally, return the configuration to wezterm
return config
