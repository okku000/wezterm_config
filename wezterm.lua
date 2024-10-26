require("util")
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local appearance_config = require("appearance")
Merge(config,appearance_config)

-- Leader and pane
config.disable_default_key_bindings = true
config.keys = require("keymaps").keys
config.key_tables = require("keymaps").key_tables
config.leader = { key = 'l', mods = 'CTRL', timeout_milliseconds = 2000 }
-- config.keys = {
--     {
--         key = '|',
--         mods = 'LEADER',
--         action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
--     },
--     {
--         key = '-',
--         mods = 'LEADER',
--         action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
--     },
--     {
--         key = 'x',
--         mods = 'LEADER',
--         action = wezterm.action.CloseCurrentPane { confirm = true },
--     },
--     -- Move between panes
--     {
--         key = 'h',
--         mods = 'LEADER|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Left',
--     },
--     {
--         key = 'l',
--         mods = 'LEADER|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Right',
--     },
--     {
--         key = 'k',
--         mods = 'LEADER|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Up',
--     },
--     {
--         key = 'j',
--         mods = 'LEADER|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Down',
--     },
-- }
return config
