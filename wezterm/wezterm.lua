local wezterm = require('wezterm')
local act = wezterm.action
local hostname = wezterm.hostname()

-- set font depending on which machine we are running
local font_size
local font_type
if hostname == 'pc' then
   font_size = 16
   font_type = 'Terminus'
   -- font_type = 'JetBrains Mono'
else
   font_size = 12
   font_type = 'Terminus'
end

return {
   -- multiplexing
   -- it's currently very laggy
   -- unix_domains = {
      -- {
      -- name = 'unix',
      -- },
   -- },
   -- default_gui_startup_args = { 'connect', 'unix' },

   -- use kitty keyboard protocoll
   enable_kitty_keyboard = true,

   -- work's better with tiling WMs
   adjust_window_size_when_changing_font_size = false,

   -- appearance
   -- font = wezterm.font('Terminus'),
   font = wezterm.font(font_type),
   font_size = font_size,
   -- disable ligatures
   -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

   scrollback_lines = 100000,
   enable_scroll_bar = false,

   use_fancy_tab_bar = false,
   tab_bar_at_bottom = true,

   window_background_opacity = 0.9,
   text_background_opacity = 0.9,

   window_padding = {
      left = 3,
      right = 3,
      top = 5,
      bottom = 0,
   },

   colors = {
      -- The default text color
      foreground = '#f8f8f2',
      -- The default background color
      background = '#181a26',

      -- Overrides the cell background color when the current cell is occupied by the
      -- cursor and the cursor style is set to Block
      cursor_bg = '#00fa3f',
      -- Overrides the text color when the current cell is occupied by the cursor
      cursor_fg = '#181a26',
      -- Specifies the border color of the cursor when the cursor style is set to Block,
      -- or the color of the vertical or horizontal bar when the cursor style is set to
      -- Bar or Underline.
      cursor_border = '#f8f8f2',

      -- the foreground color of selected text
      selection_fg = 'none',
      -- the background color of selected text
      selection_bg = 'rgba(68,71,90,0.5)',

      -- The color of the scrollbar "thumb"; the portion that represents the current viewport
      scrollbar_thumb = '#44475a',

      -- The color of the split lines between panes
      split = '#6272a4',

      ansi = {
         '#000000', -- black
         '#ff5555', -- red
         '#00fa3f', -- green
         '#bffa35', -- yellow
         '#c153f9', -- blue
         '#ff24a2', -- magenta
         '#26d7fd', -- cyan
         '#bfbfbf', -- white
      },
      brights = {
         '#4d4d4d', -- black
         '#ff6e67', -- red
         '#25f76b', -- green
         '#daf97d', -- yellow
         '#b682fa', -- blue
         '#ff5db9', -- magenta
         '#86e9fe', -- cyan
         '#e6e6e6', -- white
      },

      -- Arbitrary colors of the palette in the range from 16 to 255
      indexed = { [136] = '#af8700' },

      -- Since: 20220319-142410-0fcdea07
      -- When the IME, a dead key or a leader key are being processed and are effectively
      -- holding input pending the result of input composition, change the cursor
      -- to this color to give a visual cue about the compose state.
      compose_cursor = '#ff6e67',

      -- Colors for copy_mode and quick_select
      -- available since: nightly builds only
      -- In copy_mode, the color of the active text is:
      -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
      -- 2. selection_* otherwise
      copy_mode_active_highlight_bg = { Color = '#000000' },
      -- use `AnsiColor` to specify one of the ansi color palette values
      -- (index 0-15) using one of the names "Black", "Maroon", "Green",
      --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
      -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
      copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
      copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
      copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

      quick_select_label_bg = { Color = 'peru' },
      quick_select_label_fg = { Color = '#ffffff' },
      quick_select_match_bg = { AnsiColor = 'Navy' },
      quick_select_match_fg = { Color = '#ffffff' },

      tab_bar = {
         -- The color of the strip that goes along the top of the window
         -- (does not apply when fancy tab bar is in use)
         background = '#181a26',

         -- The active tab is the one that has focus in the window
         active_tab = {
            -- The color of the background area for the tab
            bg_color = '#181a26',
            -- The color of the text for the tab
            fg_color = '#00fa3f',

            -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
            -- label shown for this tab.
            -- The default is "Normal"
            intensity = 'Normal',

            -- Specify whether you want "None", "Single" or "Double" underline for
            -- label shown for this tab.
            -- The default is "None"
            underline = 'None',

            -- Specify whether you want the text to be italic (true) or not (false)
            -- for this tab.  The default is false.
            italic = false,

            -- Specify whether you want the text to be rendered with strikethrough (true)
            -- or not for this tab.  The default is false.
            strikethrough = false,
         },

         -- Inactive tabs are the tabs that do not have focus
         inactive_tab = {
            bg_color = '#181a26',
            fg_color = '#c153f9',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `inactive_tab`.
         },

         -- The new tab button that let you create new tabs
         new_tab = {
            bg_color = '#181a26',
            fg_color = '#c153f9',

            -- The same options that were listed under the `active_tab` section above
            -- can also be used for `new_tab`.
         },
      },
   },

   -- disable_default_key_bindings = true,
   -- set leader to CTRL-S
   leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 },

   -- keymappings
   keys = {
      -- clipboard
      { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'Clipboard', },
      { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection', },

      -- control panes
      {
         key = 'v',
         mods = 'LEADER',
         action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }),
      },
      {
         key = 's',
         mods = 'LEADER',
         action = act.SplitVertical({
            domain = 'CurrentPaneDomain',
         }),
      },
      { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left', },
      { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down', },
      { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up', },
      { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right', },

      -- control tabs
      { key = 'c', mods = 'LEADER', action = act.SpawnTab("CurrentPaneDomain") },
      { key = 'g', mods = 'LEADER', action = act.ActivateLastTab },
      { key = 'n', mods = 'LEADER', action = act.ActivateTabRelative(1) },
      { key = 'p', mods = 'LEADER', action = act.ActivateTabRelative(-1) },
      { key = '1', mods = 'LEADER', action = act.ActivateTab(0) },
      { key = '2', mods = 'LEADER', action = act.ActivateTab(1) },
      { key = '3', mods = 'LEADER', action = act.ActivateTab(2) },
      { key = '4', mods = 'LEADER', action = act.ActivateTab(3) },
      { key = '5', mods = 'LEADER', action = act.ActivateTab(4) },
      { key = '6', mods = 'LEADER', action = act.ActivateTab(5) },
      { key = '7', mods = 'LEADER', action = act.ActivateTab(6) },
      { key = '8', mods = 'LEADER', action = act.ActivateTab(7) },
      { key = '9', mods = 'LEADER', action = act.ActivateTab(8) },
      { key = '0', mods = 'LEADER', action = act.ActivateTab(9) },
      -- Send "CTRL-S" to the terminal when pressing CTRL-S, CTRL-S
      {
         key = 's',
         mods = 'LEADER|CTRL',
         action = wezterm.action.SendString('\x01'),
      },
   },
}
