local beautiful = require 'beautiful'
local theme_assets = require 'beautiful.theme_assets'
local xresources = require 'beautiful.xresources'
local dpi = xresources.apply_dpi
local gfs = require 'gears.filesystem'
local themes_path = gfs.get_configuration_dir()
local colors = require 'theme.current.colors'

local theme = {}

theme.font = 'Inter Medium 10'

theme.bg_normal = colors.base
theme.bg_focus = colors.surface_0
theme.bg_urgent = colors.surface_1
theme.bg_minimize = theme.bg_normal
theme.bg_systray = theme.bg_normal

theme.fg_normal = colors.subtext_0
theme.fg_focus = colors.text
theme.fg_urgent = colors.red
theme.fg_minimize = colors.subtext_0

theme.gap_single_client = false
theme.useless_gap = dpi(2)
theme.border_width = dpi(2)
theme.border_color_normal = colors.overlay_0
theme.border_color_active = colors.lavender
theme.border_color_marked = colors.yellow

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
theme.taglist_bg_focus = colors.surface_1
-- custom vars, might not be compatible with random functionality
theme.taglist_fg_hover = colors.base
theme.taglist_bg_hover = colors.text

-- tasklist_[bg|fg]_[focus|urgent]
theme.tasklist_fg = colors.red
theme.tasklist_bg_focus = colors.surface_1

-- theme.tasklist_shape = require('gears').shape.rounded_rect
-- theme.tasklist_shape_border_width = 1
-- theme.tasklist_shape_border_color = colors.red
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
theme.hotkeys_fg = colors.text
theme.hotkeys_modifiers_fg = colors.subtext_0
theme.hotkeys_group_margin = dpi(16)
-- theme.hotkeys_modifiers_fg = colors.subtext_0
-- theme.hotkeys_modifiers_fg = colors.subtext_0
-- theme.hotkeys_modifiers_fg = colors.subtext_0
-- theme.hotkeys_modifiers_fg = colors.subtext_0
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(6)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
beautiful.notification_font = 'Inter Medium 18'
theme.notification_bg = colors.surface_0
theme.notification_fg = colors.text
theme.notification_margin = dpi(16)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. 'theme/current/submenu.png'
theme.menu_height = dpi(16)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.wallpaper = themes_path .. 'theme/current/background.png'

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. 'theme/current/layouts/fairhw.png'
theme.layout_fairv = themes_path .. 'theme/current/layouts/fairvw.png'
theme.layout_floating = themes_path .. 'theme/current/layouts/floatingw.png'
theme.layout_magnifier = themes_path .. 'theme/current/layouts/magnifierw.png'
theme.layout_max = themes_path .. 'theme/current/layouts/maxw.png'
theme.layout_fullscreen = themes_path .. 'theme/current/layouts/fullscreenw.png'
theme.layout_tilebottom = themes_path .. 'theme/current/layouts/tilebottomw.png'
theme.layout_tileleft = themes_path .. 'theme/current/layouts/tileleftw.png'
theme.layout_tile = themes_path .. 'theme/current/layouts/tilew.png'
theme.layout_tiletop = themes_path .. 'theme/current/layouts/tiletopw.png'
theme.layout_spiral = themes_path .. 'theme/current/layouts/spiralw.png'
theme.layout_dwindle = themes_path .. 'theme/current/layouts/dwindlew.png'
theme.layout_cornernw = themes_path .. 'theme/current/layouts/cornernww.png'
theme.layout_cornerne = themes_path .. 'theme/current/layouts/cornernew.png'
theme.layout_cornersw = themes_path .. 'theme/current/layouts/cornersww.png'
theme.layout_cornerse = themes_path .. 'theme/current/layouts/cornersew.png'

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
-- rnotification.connect_signal('request::rules', function()
--   rnotification.append_rule {
--     rule = { urgency = 'critical' },
--     properties = { bg = '#ff0000', fg = '#ffffff' },
--   }
-- end)
--
return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
