local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
  local _, _, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

return {
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
  window_close_confirmation = "NeverPrompt",
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Catppuccin Mocha",
  colors = {
    background = "black",
    visual_bell = "white",
  },
  window_decorations = "RESIZE",
  adjust_window_size_when_changing_font_size = false,
  audible_bell = "Disabled",
  visual_bell = {
    fade_in_function = "EaseIn",
    fade_in_duration_ms = 100,
    fade_out_function = "EaseOut",
    fade_out_duration_ms = 100,
  },
  clean_exit_codes = { 130 },
  default_cursor_style = "BlinkingBar",
  enable_scroll_bar = false,
  automatically_reload_config = true,
}
