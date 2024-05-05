local beautiful = require 'beautiful'
local gears = require 'gears'

beautiful.init(gears.filesystem.get_configuration_dir() .. 'default/theme.lua')

require 'theme.notifications'
require 'theme.wallpaper'
