local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config.font = wezterm.font('Menlo')
-- config.font_size = 14
-- config.color_scheme = 'Monokai (terminal.sexy)'

config.font = wezterm.font('JetBrains Mono')
config.font_size = 12
config.color_scheme = 'Catppuccin Mocha'

config.window_background_opacity = 0.9
config.macos_window_background_blur = 20

config.hide_tab_bar_if_only_one_tab = true

-- Side bar --
pcall(function()
  config.sidebar = {
    width = '600px',
    colors = {
      bg = '#515161',
      accent = '#5091ff',
    },
  }
end)

-- Suppress native toasts from focused pane (sidebar shows them instead)
config.notification_handling = 'SuppressFromFocusedPane'

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5,
}

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

local act = wezterm.action
config.keys = {
 -- Mac-native feeling
  { key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "w", mods = "CMD", action = act.CloseCurrentTab({ confirm = true }) },
  { key = "f", mods = "CMD", action = act.Search("CurrentSelectionOrEmptyString") },
  { key = "+", mods = "CMD", action = act.IncreaseFontSize },
  { key = "-", mods = "CMD", action = act.DecreaseFontSize },
  { key = "0", mods = "CMD", action = act.ResetFontSize },

  -- Tab navigation (AZERTY-friendly)
  { key = "LeftArrow", mods = "CMD|SHIFT", action = act.ActivateTabRelative(-1) },
  { key = "RightArrow", mods = "CMD|SHIFT", action = act.ActivateTabRelative(1) },
  { key = "UpArrow", mods = "CMD|SHIFT", action = act.SwitchWorkspaceRelative(-1) },
  { key = "DownArrow", mods = "CMD|SHIFT", action = act.SwitchWorkspaceRelative(1) },
  { key = "1", mods = "CMD", action = act.ActivateTab(0) },
  { key = "2", mods = "CMD", action = act.ActivateTab(1) },
  { key = "3", mods = "CMD", action = act.ActivateTab(2) },
  { key = "4", mods = "CMD", action = act.ActivateTab(3) },
  { key = "5", mods = "CMD", action = act.ActivateTab(4) },
  { key = "6", mods = "CMD", action = act.ActivateTab(5) },
  { key = "7", mods = "CMD", action = act.ActivateTab(6) },
  { key = "8", mods = "CMD", action = act.ActivateTab(7) },
  { key = "9", mods = "CMD", action = act.ActivateTab(8) },

  -- Leader-based pane workflow, chosen for AZERTY comfort
  { key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "h", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

  { key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  -- AZERTY: pipe character (Option+Shift+L)
  { key = "l", mods = "ALT|SHIFT", action = act.SendString("|") },

  -- AZERTY: tilde character (Option+N)
  { key = "n", mods = "ALT", action = act.SendString("~") },
}

return config
