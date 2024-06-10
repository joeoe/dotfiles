local gfs = require("gears.filesystem")
local theme_dir = gfs.get_configuration_dir() .. "theme/current"

local M = {}

M.layout_fairh = theme_dir .. "/layouts/fairhw.png"
M.layout_fairv = theme_dir .. "/layouts/fairvw.png"
M.layout_floating = theme_dir .. "/layouts/floatingw.png"
M.layout_magnifier = theme_dir .. "/layouts/magnifierw.png"
M.layout_max = theme_dir .. "/layouts/maxw.png"
M.layout_fullscreen = theme_dir .. "/layouts/fullscreenw.png"
M.layout_tilebottom = theme_dir .. "/layouts/tilebottomw.png"
M.layout_tileleft = theme_dir .. "/layouts/tileleftw.png"
M.layout_tile = theme_dir .. "/layouts/tilew.png"
M.layout_tiletop = theme_dir .. "/layouts/tiletopw.png"
M.layout_spiral = theme_dir .. "/layouts/spiralw.png"
M.layout_dwindle = theme_dir .. "/layouts/dwindlew.png"
M.layout_cornernw = theme_dir .. "/layouts/cornernww.png"
M.layout_cornerne = theme_dir .. "/layouts/cornernew.png"
M.layout_cornersw = theme_dir .. "/layouts/cornersww.png"
M.layout_cornerse = theme_dir .. "/layouts/cornersew.png"

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

return M
