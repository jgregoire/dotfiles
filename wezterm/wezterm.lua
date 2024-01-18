local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Appearance
config.color_scheme = 'onedarkpro_onedark_vivid'
config.bold_brightens_ansi_colors = false
-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.75
config.window_padding = {
    left = 0,
    right = '1cell',
    top = 0,
    bottom = 0,
}

config.underline_position = '-5px'
-- Figure out what platform we're on by examing the directory char
-- TODO: use wezterm.target_triple instead.
local dir_char = package.config:sub(1,1)

-- Linux-specific options
if dir_char == '/' then
    config.font = wezterm.font('Fira Code')
    config.font_size = 14.0

-- Windows-specific options
elseif dir_char == '\\' then
    config.font = wezterm.font('FiraCode Nerd Font')
    config.font_size = 12.0
    config.allow_win32_input_mode = true

    -- Focus
    config.swallow_mouse_click_on_window_focus = true
    -- config.swallow_mouse_click_on_pane_focus = true

    -- Launch into WSL
    config.default_domain = 'WSL:Ubuntu-20.04'
end

return config

