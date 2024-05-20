---------------------------
-- Default awesome theme --
---------------------------

local beautiful = require 'beautiful'
local theme_assets = require 'beautiful.theme_assets'
local xresources = require 'beautiful.xresources'
local rnotification = require 'ruled.notification'
local dpi = xresources.apply_dpi

local gfs = require 'gears.filesystem'
local themes_path = gfs.get_configuration_dir()

local c_text = '#cdd6f4'
local c_subtext_1 = '#bac2de'
local c_subtext_0 = '#a6adc8'
local c_overlay_2 = '#9399b2'
local c_overlay_1 = '#7f849c'
local c_overlay_0 = '#6c7086'
local c_surface_2 = '#585b70'
local c_surface_1 = '#45475a'
local c_surface_0 = '#313244'
local c_base = '#1e1e2e'
local c_mantle = '#181825'
local c_crust = '#11111b'
local c_red = '#f38ba8'
local c_lavender = '#b4befe'
local c_yellow = '#f9e2af'

local theme = {}

theme.font = 'Inter Medium 10'

theme.bg_normal = c_crust
theme.bg_focus = c_surface_0
theme.bg_urgent = c_surface_1
theme.bg_minimize = c_crust
theme.bg_systray = theme.bg_normal

theme.fg_normal = c_subtext_0
theme.fg_focus = c_text
theme.fg_urgent = c_red
theme.fg_minimize = c_subtext_0

theme.useless_gap = dpi(2)
theme.border_width = dpi(2)
theme.border_color_normal = c_overlay_0
theme.border_color_active = c_lavender
theme.border_color_marked = c_yellow

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
theme.hotkeys_fg = c_text
theme.hotkeys_modifiers_fg = c_subtext_0
theme.hotkeys_group_margin = dpi(16)
-- theme.hotkeys_modifiers_fg = c_subtext_0
-- theme.hotkeys_modifiers_fg = c_subtext_0
-- theme.hotkeys_modifiers_fg = c_subtext_0
-- theme.hotkeys_modifiers_fg = c_subtext_0
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
beautiful.notification_font = 'Inter Medium 18'
theme.notification_bg = c_surface_0
theme.notification_fg = c_text
theme.notification_margin = dpi(16)

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. 'default/submenu.png'
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. 'default/titlebar/close_normal.png'
theme.titlebar_close_button_focus = themes_path .. 'default/titlebar/close_focus.png'

theme.titlebar_minimize_button_normal = themes_path .. 'default/titlebar/minimize_normal.png'
theme.titlebar_minimize_button_focus = themes_path .. 'default/titlebar/minimize_focus.png'

theme.titlebar_ontop_button_normal_inactive = themes_path .. 'default/titlebar/ontop_normal_inactive.png'
theme.titlebar_ontop_button_focus_inactive = themes_path .. 'default/titlebar/ontop_focus_inactive.png'
theme.titlebar_ontop_button_normal_active = themes_path .. 'default/titlebar/ontop_normal_active.png'
theme.titlebar_ontop_button_focus_active = themes_path .. 'default/titlebar/ontop_focus_active.png'

theme.titlebar_sticky_button_normal_inactive = themes_path .. 'default/titlebar/sticky_normal_inactive.png'
theme.titlebar_sticky_button_focus_inactive = themes_path .. 'default/titlebar/sticky_focus_inactive.png'
theme.titlebar_sticky_button_normal_active = themes_path .. 'default/titlebar/sticky_normal_active.png'
theme.titlebar_sticky_button_focus_active = themes_path .. 'default/titlebar/sticky_focus_active.png'

theme.titlebar_floating_button_normal_inactive = themes_path .. 'default/titlebar/floating_normal_inactive.png'
theme.titlebar_floating_button_focus_inactive = themes_path .. 'default/titlebar/floating_focus_inactive.png'
theme.titlebar_floating_button_normal_active = themes_path .. 'default/titlebar/floating_normal_active.png'
theme.titlebar_floating_button_focus_active = themes_path .. 'default/titlebar/floating_focus_active.png'

theme.titlebar_maximized_button_normal_inactive = themes_path .. 'default/titlebar/maximized_normal_inactive.png'
theme.titlebar_maximized_button_focus_inactive = themes_path .. 'default/titlebar/maximized_focus_inactive.png'
theme.titlebar_maximized_button_normal_active = themes_path .. 'default/titlebar/maximized_normal_active.png'
theme.titlebar_maximized_button_focus_active = themes_path .. 'default/titlebar/maximized_focus_active.png'

theme.wallpaper = themes_path .. 'default/background.png'

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. 'default/layouts/fairhw.png'
theme.layout_fairv = themes_path .. 'default/layouts/fairvw.png'
theme.layout_floating = themes_path .. 'default/layouts/floatingw.png'
theme.layout_magnifier = themes_path .. 'default/layouts/magnifierw.png'
theme.layout_max = themes_path .. 'default/layouts/maxw.png'
theme.layout_fullscreen = themes_path .. 'default/layouts/fullscreenw.png'
theme.layout_tilebottom = themes_path .. 'default/layouts/tilebottomw.png'
theme.layout_tileleft = themes_path .. 'default/layouts/tileleftw.png'
theme.layout_tile = themes_path .. 'default/layouts/tilew.png'
theme.layout_tiletop = themes_path .. 'default/layouts/tiletopw.png'
theme.layout_spiral = themes_path .. 'default/layouts/spiralw.png'
theme.layout_dwindle = themes_path .. 'default/layouts/dwindlew.png'
theme.layout_cornernw = themes_path .. 'default/layouts/cornernww.png'
theme.layout_cornerne = themes_path .. 'default/layouts/cornernew.png'
theme.layout_cornersw = themes_path .. 'default/layouts/cornersww.png'
theme.layout_cornerse = themes_path .. 'default/layouts/cornersew.png'

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