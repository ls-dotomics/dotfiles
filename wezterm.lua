local wezterm = require("wezterm")
local act = wezterm.action

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 12,
  color_scheme = "Catppuccin Mocha",

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = true,
  window_decorations = "RESIZE",

  window_padding = {
    left = 10,
    right = 10,
    top = 8,
    bottom = 8,
  },

  tab_max_width = 50,
  scrollback_lines = 5000,
  default_cursor_style = "BlinkingBar",
  max_fps = 120,

  leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },

  keys = {
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
  },
}
