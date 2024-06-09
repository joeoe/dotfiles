pcall(require, 'luarocks.loader')

local gears = require 'gears'
local awful = require 'awful'
local naughty = require 'naughty'
local bling = require 'bling'

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
organizer = '/home/joei/Applications/Marvin-1.64.4_4c63d0c5ec5dd836bd920309c9709a48.AppImage'

require 'theme'
require 'config'

-- Autostart
-- awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. 'autorun.sh')
-- awful.spawn.once(browser)
-- awful.spawn.once(terminal, { tag = '2' })
-- awful.spawn.once(notes, { tag = '3' })
-- awful.spawn.once(organizer, { tag = '3' })

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal('mouse::enter', function(c)
  c:activate { context = 'mouse_enter', raise = false }
end)

local term_scratch = bling.module.scratchpad {
  command = 'wezterm start --class spad', -- How to spawn the scratchpad
  rule = { instance = 'spad' }, -- The rule that the scratchpad will be searched by
  sticky = true, -- Whether the scratchpad should be sticky
  autoclose = true, -- Whether it should hide itself when losing focus
  floating = true, -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
  geometry = { x = 360, y = 90, height = 900, width = 1200 }, -- The geometry in a floating state
  reapply = true, -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
  dont_focus_before_close = false, -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
}

awful.keyboard.append_global_keybindings {
  awful.key({ modkey, 'Shift' }, 's', function()
    term_scratch:toggle()
  end, { description = 'Toggle scratchpad', group = 'bling' }),
}
