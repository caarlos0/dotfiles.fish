local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

local scheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
scheme.background = "#000000"

return {
  -- colors
  color_schemes = {
    ["OLEDppuccin"] = scheme,
  },
  color_scheme = "OLEDppuccin",

  -- general styling
  default_cursor_style = "BlinkingBar",
  enable_scroll_bar = false,

  -- fonts
  font = wezterm.font("Monolisa"),
  font_size = 13.0,
  harfbuzz_features = {
    "zero=1",
    "ss01=1",
    "ss02=1",
    "ss03=1",
    "ss04=1",
    "ss05=1",
    "ss06=1",
    "onum=0",
    "frac=0",
    "sups=0",
    "subs=0",
    "calt=1",
    "liga=1",
  },

  -- tab bar
  tab_max_width = 32,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,

  -- window
  window_close_confirmation = "NeverPrompt",
  window_decorations = "RESIZE",
  adjust_window_size_when_changing_font_size = false,

  -- bell
  audible_bell = "Disabled",
  visual_bell = {
    fade_in_function = "EaseIn",
    fade_in_duration_ms = 100,
    fade_out_function = "EaseOut",
    fade_out_duration_ms = 100,
  },

  -- general config
  clean_exit_codes = { 130 },
  automatically_reload_config = true,
}
