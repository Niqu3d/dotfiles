local wezterm = require("wezterm")

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then config = wezterm.config_builder() end

-- ==========================================================
-- Settings & OLED Optimization
-- ==========================================================

config.color_scheme = "VisiBlue (terminal.sexy)"
config.font = wezterm.font('Hack')
config.font_size = 10
config.line_height = 1

-- Terminal window settings
config.initial_cols = 150
config.initial_rows = 45
config.window_background_opacity = 0.85
config.window_padding = { left = 10, right = 10, top = 10, bottom = 5 }
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

-- Dim inactive panes (OLED Burn-in prevention)
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5
}

-- ==========================================================
-- Local Variables & Keybindings
-- ==========================================================

local success, locals = pcall(require, "local_vars")
local soc_ip = success and locals.soc_ip or "root@REPLACE_ME"

config.keys = {
  -- 1. THE SSH DASHBOARD (Pixel Force)
  {
    key = 'S',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      local target_ip = soc_ip or "YOUR_IP_HERE"

      -- 1. Apply overrides FIRST to "lock" the window's idea of size
      window:set_config_overrides({
        font_size = 12,
        -- We include these to help WezTerm "resist" the snap-back
        initial_cols = 250,
        initial_rows = 65,
      })

      -- 2. Force the physical pixel size
      window:set_inner_size(2100, 900)

      -- 3. Spawn the command
      window:perform_action(
        wezterm.action.SpawnCommandInNewTab {
          args = { "ssh", "-t", target_ip, "/home/niqu3d/soc-dash.sh" },
        },
        pane
      )

      window:active_tab():set_title("SOC DASHBOARD")
    end),
  },

  -- 2. THE SNAP BACK (Pixel Restore)
  {
    key = 'R',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(window, pane)
      -- Close the dashboard tab if active
      if window:active_tab():get_title() == "SOC DASHBOARD" then
        window:perform_action(wezterm.action.CloseCurrentTab{ confirm = false }, pane)
      end

      -- Reset font/config to default (Size 10)
      window:set_config_overrides({})

      -- Force the window back to a smaller pixel size
      -- (Roughly matches 150x45 on an ultrawide)
      window:set_inner_size(1300, 650)
    end),
  },




  -- Management & Navigation
  {
    key = 'X',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
   -- Zoom the active pane (Great for focusing on one part of the dashboard)
    key = 'Z',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
}
-- Alt + Arrows to navigate between your 4 panes
for _, dir in ipairs({"Left", "Right", "Up", "Down"}) do
  table.insert(config.keys, {
    key = dir .. "Arrow",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection(dir),
  })
end
return config
