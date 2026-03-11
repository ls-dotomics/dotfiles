local wezterm = require("wezterm")
local act = wezterm.action

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 12,
  color_scheme = "Catppuccin Mocha",

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",

  window_padding = {
    left = 10,
    right = 10,
    top = 8,
    bottom = 8,
  },

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

    -- Leader-based pane workflow, chosen for AZERTY comfort
    { key = "v", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "h", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

    { key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  },
}
