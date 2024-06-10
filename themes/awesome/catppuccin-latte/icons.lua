local gfs = require("gears.filesystem")
local theme_dir = gfs.get_configuration_dir() .. "theme/current"

local M = {}

M.layout_fairh = theme_dir .. "/layouts/fairh.png"
M.layout_fairv = theme_dir .. "/layouts/fairv.png"
M.layout_floating = theme_dir .. "/layouts/floating.png"
M.layout_magnifier = theme_dir .. "/layouts/magnifier.png"
M.layout_max = theme_dir .. "/layouts/max.png"
M.layout_fullscreen = theme_dir .. "/layouts/fullscreen.png"
M.layout_tilebottom = theme_dir .. "/layouts/tilebottom.png"
M.layout_tileleft = theme_dir .. "/layouts/tileleft.png"
M.layout_tile = theme_dir .. "/layouts/tile.png"
M.layout_tiletop = theme_dir .. "/layouts/tiletop.png"
M.layout_spiral = theme_dir .. "/layouts/spiral.png"
M.layout_dwindle = theme_dir .. "/layouts/dwindle.png"
M.layout_cornernw = theme_dir .. "/layouts/cornernw.png"
M.layout_cornerne = theme_dir .. "/layouts/cornerne.png"
M.layout_cornersw = theme_dir .. "/layouts/cornersw.png"
M.layout_cornerse = theme_dir .. "/layouts/cornerse.png"

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

return M
