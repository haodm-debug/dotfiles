local wezterm = require("wezterm")
local config = wezterm.config_builder()

---colorscheme & theme
config.color_scheme = "Tokyonight Night"
config.bold_brightens_ansi_colors = "BrightAndBold"
config.colors = {
    foreground = "#C0CAF5",
    background = "#1A1B26",
    cursor_bg = "#C0CAF5",
    cursor_fg = "#1A1B26",
    cursor_border = "#C0CAF5",
    selection_bg = "#283457",
    selection_fg = "#C0CAF5",
    scrollbar_thumb = "#292E42",
    split = "#7AA2F7",
    ansi = {
      "#15161E",
      "#F7768E",
      "#9ECE6A",
      "#E0AF68",
      "#7AA2F7",
      "#BB9AF7",
      "#7DCFFF",
      "#A9B1D6",
    },
    brights = {
      "#414868",
      "#F7768E",
      "#9ECE6A",
      "#E0AF68",
      "#7AA2F7",
      "#BB9AF7",
      "#7DCFFF",
      "#C0CAF5",
    },
    indexed = {},
    compose_cursor = "#FF9E64",
    copy_mode_active_highlight_bg = { Color = "#283457" },
    copy_mode_active_highlight_fg = { Color = "#C0CAF5" },
    copy_mode_inactive_highlight_bg = { Color = "#292E42" },
    copy_mode_inactive_highlight_fg = { Color = "#C0CAF5" },
    quick_select_label_bg = { Color = "#F7768E" },
    quick_select_label_fg = { Color = "#C0CAF5" },
    quick_select_match_bg = { Color = "#E0AF68" },
    quick_select_match_fg = { Color = "#C0CAF5" },
    visual_bell = "#283457",
    tab_bar = {
      background = "#1A1B26",
      inactive_tab_edge = "#16161E",
      active_tab = { fg_color = "#16161E", bg_color = "#7AA2F7" },
      inactive_tab = { fg_color = "#545C7E", bg_color = "#292E42" },
      inactive_tab_hover = { fg_color = "#7AA2F7", bg_color = "#292E42" },
      new_tab = { fg_color = "#7AA2F7", bg_color = "#1A1B26" },
      new_tab_hover = { fg_color = "#7AA2F7", bg_color = "#1A1B26", intensity = "Bold" },
    },
  }

---font
config.adjust_window_size_when_changing_font_size = false
config.allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace"
config.anti_alias_custom_block_glyphs = true
config.underline_position = -2.5
config.underline_thickness = "2px"
config.warn_about_missing_glyphs = false
config.font = wezterm.font_with_fallback {
    {
      family = "FiraCode Nerd Font",
      weight = "Regular",
      harfbuzz_features = {
        -- "cv01", ---styles: a
        -- "cv02", ---styles: g
        "cv06", ---styles: i (03..06)
        -- "cv09", ---styles: l (07..10)
        "cv12", ---styles: 0 (11..13, zero)
        "cv14", ---styles: 3
        "cv16", ---styles: * (15..16)
        -- "cv17", ---styles: ~
        -- "cv18", ---styles: %
        -- "cv19", ---styles: <= (19..20)
        -- "cv21", ---styles: =< (21..22)
        -- "cv23", ---styles: >=
        -- "cv24", ---styles: /=
        "cv25", ---styles: .-
        "cv26", ---styles: :-
        -- "cv27", ---styles: []
        "cv28", ---styles: {. .}
        "cv29", ---styles: { }
        -- "cv30", ---styles: |
        "cv31", ---styles: ()
        "cv32", ---styles: .=
        -- "ss01", ---styles: r
        -- "ss02", ---styles: <= >=
        "ss03", ---styles: &
        "ss04", ---styles: $
        "ss05", ---styles: @
        -- "ss06", ---styles: \\
        "ss07", ---styles: =~ !~
        -- "ss08", ---styles: == === != !==
        "ss09", ---styles: >>= <<= ||= |=
        -- "ss10", ---styles: Fl Tl fi fj fl ft
        -- "onum", ---styles: 1234567890
      },
    },
    { family = "Noto Color Emoji" },
    { family = "LegacyComputing" },
  }

local monaspace_features = { "dlig", "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08" }
config.font_rules = {
    {
      intensity = "Normal",
      italic = true,
      font = wezterm.font_with_fallback {
        {
          family = "Monaspace Radon Var",
          style = "Italic",
          weight = "Regular",
          stretch = "Normal",
          harfbuzz_features = monaspace_features,
        },
        { family = "Symbols Nerd Font" },
      },
    },
    {
      intensity = "Bold",
      italic = true,
      font = wezterm.font_with_fallback {
        {
          family = "Monaspace Krypton Var",
          style = "Italic",
          weight = "ExtraBold",
          harfbuzz_features = monaspace_features,
          scale = 1.1,
        },
        { family = "Symbols Nerd Font" },
      },
    },
  }

---char select and command palette
config.font_size = 12
config.char_select_font_size = 12
config.command_palette_font_size = 12
config.command_palette_rows = 20

---cursor
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.cursor_blink_rate = 500
config.default_cursor_style = "BlinkingBar"
config.cursor_thickness = 1
config.force_reverse_video_cursor = true

config.hide_mouse_cursor_when_typing = true

---text blink
config.text_blink_ease_in = "EaseIn"
config.text_blink_ease_out = "EaseOut"
config.text_blink_rapid_ease_in = "Linear"
config.text_blink_rapid_ease_out = "Linear"
config.text_blink_rate = 500
config.text_blink_rate_rapid = 250

---visual bell
config.audible_bell = "Disabled"
-- config.visual_bell = {
--   fade_in_function = "EaseOut",
--   fade_in_duration_ms = 200,
--   fade_out_function = "EaseIn",
--   fade_out_duration_ms = 200,
-- }

---window appearance
config.window_padding = { left = 10, right = 10, top = 10, bottom = 1 }
config.integrated_title_button_alignment = "Right"
config.integrated_title_button_style = "Windows"
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.window_background_opacity = 0.7

---exit behavior
config.clean_exit_codes = { 130 }
config.exit_behavior = "CloseOnCleanExit"
config.exit_behavior_messaging = "Verbose"
config.skip_close_confirmation_for_processes_named = {
  "bash",
  "sh",
  "zsh",
  "fish",
  "tmux",
  "nu",
  "cmd.exe",
  "pwsh.exe",
  "powershell.exe",
}
config.window_close_confirmation = "AlwaysPrompt"

-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the defualt when opening Wezterm
config.default_domain = 'WSL:Ubuntu'

return config
