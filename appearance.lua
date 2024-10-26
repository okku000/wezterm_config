local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.font_size = 15
config.font = wezterm.font('Source Code Pro', { weight = 'Medium' })
config.line_height = 1.3
config.window_frame = {
    border_bottom_height = "0.5cell",
}

config.window_padding = {
    left = "0cell",
    right = "0cell",
    top = "0cell",
    bottom = "0cell",
}
-- tabs
config.tab_bar_at_bottom = true
config.tab_max_width = 32
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
local function tab_title(tab_info)
    local title = tab_info.tab_title
    -- if the tab title is explicitly set, take that
    if title and #title > 0 then
        return title
    end
    -- Otherwise, use the title from the active pane
    -- in that tab
    return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, conf, hover, max_width)
    local background = "#65737E"
    local foreground = "#F0F2F5"
    local edge_background = "#DADADA"

    if tab.is_active or hover then
        background = "#E5C07B"
        foreground = "#282C34"
    end
    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    local max = config.tab_max_width - 9
    if #title > max then
        title = wezterm.truncate_right(title, max) .. "…"
    end

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = " " },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Attribute = { Intensity = tab.is_active and "Bold" or "Normal" } },
        { Text = " " .. (tab.tab_index + 1) .. ": " .. title .. " " },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = "" },
    }
end)
config.color_scheme = 'Seoul256 Light (Gogh)'
config.colors = {
    tab_bar = {
        background = "#DADADA",
    },
}
return config
