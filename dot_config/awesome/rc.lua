pcall(require, 'luarocks.loader')

local gears = require 'gears'
local awful = require 'awful'
local naughty = require 'naughty'

require 'awful.hotkeys_popup.keys'
require 'awful.autofocus'

-- Error check for fallback config during startup
naughty.connect_signal('request::display_error', function(message, startup)
  naughty.notification {
    urgency = 'critical',
    title = 'Oops, an error happened' .. (startup and ' during startup!' or '!'),
    message = message,
  }
end)

-- {{{ Variable definitions
modkey = 'Mod4'

terminal = 'kitty'
editor = os.getenv 'EDITOR' or 'nvim'
editor_cmd = terminal .. ' -e ' .. editor
browser = 'firefox'
browser_media = 'thorium-browser'
browser_mini = 'qutebrowser'
filebrowser = 'thunar'
password_manager = 'bitwarden-desktop'
notes = 'obsidian'
-- }}}

require 'theme'
require 'config'

-- Autostart
awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. 'autorun.sh')

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
  c:activate { context = 'mouse_enter', raise = false }
end)
