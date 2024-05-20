local gears = require 'gears'
local wibox = require 'wibox'
local awful = require 'awful'

screen.connect_signal('request::wallpaper', function(s)
  local p = '/data/smol/images/walls/_rotation/'
  if s.geometry.width > 2600 then
    p = p .. 'ultrawide'
  else
    p = p .. 'wide'
  end

  awful.wallpaper {
    screen = s,
    bg = '#222',
    widget = {
      {
        image = gears.filesystem.get_random_file_from_dir(p, { '.jpg', '.png', '.svg' }, true),
        resize = true,
        widget = wibox.widget.imagebox,
      },
      valign = 'center',
      halign = 'center',
      tiled = false,
      widget = wibox.container.tile,
    },
  }
end)

function next_wall()
  for s in screen do
    s:emit_signal 'request::wallpaper'
  end
end

gears.timer {
  timeout = 1800,
  autostart = true,
  callback = next_wall,
}