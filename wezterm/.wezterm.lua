local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- Settings
config.color_scheme = "VisiBlue (terminal.sexy)"  -- You can choose a dark theme here for OLED optimization
config.font = wezterm.font('Hack')  -- Keeping the font as Hack
config.font_size = 10  -- Your preferred font size
config.line_height = 1  -- Your preferred line height

-- Terminal window settings
config.initial_cols = 150  -- Ultrawide screens benefit from more columns
config.initial_rows = 45
config.window_background_opacity = 0.85  -- Slightly reduced opacity for OLED optimization
config.window_padding = { left = 2, right = 2, top = 2, bottom = 1 }
config.window_decorations = "RESIZE"
config.integrated_title_button_alignment = "Right"
config.integrated_title_button_style = "Windows"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }

-- Cursor settings
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.cursor_blink_rate = 500
config.default_cursor_style = "BlinkingUnderline"
config.cursor_thickness = 1
config.force_reverse_video_cursor = true

-- Tab Bar settings
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 25
config.switch_to_last_active_tab_when_closing_tab = true
config.show_new_tab_button_in_tab_bar = false
config.show_tabs_in_tab_bar = true

-- Default opens
config.default_prog = { '/bin/nu' }
config.default_workspace = "home"
config.scrollback_lines = 3000

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5  -- Dim inactive panes for OLED optimization
}

return config
