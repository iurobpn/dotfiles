-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
-- config.font = wezterm.font("MesloLGLNerdFont")
config.font = wezterm.font_with_fallback {
  'MesloLGLNerdFont',
  'FiraCodeNerdFont'
}

-- config.font = wezterm.font("HackNerdFont")
-- config.font = wezterm.font("FiraCodeNerdFont")
-- config.color_scheme = 'GruvboxDark'
config.unix_domains = {
    {
        name = 'unix',
    },
}
-- This is where you actually apply your config choices
-- wezterm.on('update-right-status', function(window, pane)
--     window:set_left_status 'left'
--     window:set_right_status 'right'
-- end)
-- -- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
config.enable_tab_bar = false
local act = wezterm.action
config.keys = {
    {
        key = '/', mods = 'CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' }
    },
    {
        key = '\\', mods = 'CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' }
    },
    { key = 'LeftArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Left'  },
    { key = 'RightArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Up'  },
    { key = 'DownArrow', mods = 'ALT|SHIFT', action = act.ActivatePaneDirection 'Down' },
}
config.max_fps = 60
-- config.use_fancy_tab_bar = false
-- config.show_tabs_in_tab_bar = false
-- config.show_new_tab_button_in_tab_bar = false

-- and finally, return the configuration to wezterm
return config

