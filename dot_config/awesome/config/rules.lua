local ruled = require 'ruled'
local awful = require 'awful'

-- Rules to apply to new clients.
ruled.client.connect_signal('request::rules', function()
  -- All clients will match this rule.
  ruled.client.append_rule {
    id = 'global',
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      screen = awful.screen.preferred,
      placement = awful.placement.centered + awful.placement.no_offscreen,
      callback = awful.client.setslave,
    },
  }

  -- Floating clients.
  ruled.client.append_rule {
    id = 'floating',
    rule_any = {
      instance = { 'copyq', 'pinentry' },
      class = {
        'Arandr',
        'Blueman-manager',
        'Gpick',
        'Kruler',
        'Sxiv',
        'Tor Browser',
        'Wpa_gui',
        'veromix',
        'xtightvncviewer',
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        'Event Tester', -- xev.
      },
      role = {
        'AlarmWindow', -- Thunderbird's calendar.
        'ConfigManager', -- Thunderbird's about:config.
        -- I want popups floating but NOT dev tools?
        -- 'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true },
  }

  ruled.client.append_rule {
    rule = {
      class = 'Anki',
      name = 'Preferences',
    },
    properties = { floating = true },
  }

  ruled.client.append_rule {
    rule = { name = { 'Amazing Marvin - Quick Add' } },
    properties = { border_width = 0 },
  }

  -- Default screens & tags
  ruled.client.append_rule {
    rule = { class = 'firefox' },
    properties = { screen = 1, tag = '1' },
  }
  ruled.client.append_rule {
    rule = { class = 'obsidian' },
    properties = { screen = 1, tag = '3' },
  }
  ruled.client.append_rule {
    rule = { class = 'Logseq' },
    properties = { screen = 1, tag = '3' },
  }
  ruled.client.append_rule {
    rule = { class = 'anytype' },
    properties = { screen = 1, tag = '3' },
  }
  ruled.client.append_rule {
    rule = { class = 'Marvin' },
    properties = { screen = 1, tag = '3' },
  }
  ruled.client.append_rule {
    rule = { class = 'steam' },
    properties = { screen = 1, tag = '8' },
  }
  -- Tekken
  ruled.client.append_rule {
    rule = { name = 'TEKKEN™8  ' },
    -- rule = { class = "steam_app_1778820" },
    properties = { screen = 1, tag = '8', fullscreen = true },
  }
  -- Second screen
  ruled.client.append_rule {
    rule = { class = 'Slack' },
    properties = { screen = 2, tag = '7' },
  }
end)

-- ruled.client.connect_signal("request::manage", function (client, context)
--   if client.floating and context == "new" then
--     client.placement = awful.placement.centered + awful.placement.no_overlap(c, args)
--   end
-- end)
