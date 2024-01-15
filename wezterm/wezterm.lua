local wezterm = require('wezterm')

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = 'onedark_vivid'
config.bold_brightens_ansi_colors = false
config.font = wezterm.font('FiraCode Nerd Font')
config.font_size = 12.0

return config

