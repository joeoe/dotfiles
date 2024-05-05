local awful = require 'awful'
local hotkeys_popup = require 'awful.hotkeys_popup'
local gears = require 'gears'

-- General Awesome keys
awful.keyboard.append_global_keybindings {
  awful.key({ modkey }, 's', hotkeys_popup.show_help, { description = 'show help', group = 'awesome' }),
  -- awful.key({ modkey }, "w", function()
  -- 	mymainmenu:show()
  -- end, { description = "show main menu", group = "awesome" }),
  awful.key({ modkey, 'Shift' }, 'w', next_wall, { description = 'next wallpaper' }),
  awful.key({ modkey, 'Shift' }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
  awful.key({ modkey, 'Shift' }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),

  awful.key({ modkey, 'Shift' }, 'x', function()
    awful.prompt.run {
      prompt = 'Run Lua code: ',
      textbox = awful.screen.focused().mypromptbox.widget,
      exe_callback = awful.util.eval,
      history_path = awful.util.get_cache_dir() .. '/history_eval',
    }
  end, { description = 'lua execute prompt', group = 'awesome' }),

  awful.key({ modkey }, 't', function()
    awful.spawn(terminal)
  end, { description = 'open a terminal', group = 'launcher' }),

  awful.key({ modkey }, 'b', function()
    awful.spawn(browser)
  end, { description = 'open browser', group = 'launcher' }),

  awful.key({ modkey, 'Shift' }, 'b', function()
    awful.spawn(browser_mini)
  end, { description = 'open mini browser', group = 'launcher' }),

  awful.key({ modkey, 'Control' }, 'b', function()
    awful.spawn(browser_media)
  end, { description = 'open media browser', group = 'launcher' }),

  awful.key({ modkey }, 'w', function()
    awful.spawn(password_manager)
  end, { description = 'open password_manager', group = 'launcher' }),

  awful.key({ modkey }, 'o', function()
    awful.spawn(notes)
  end, { description = 'open notes app', group = 'launcher' }),

  awful.key({ modkey }, 'e', function()
    awful.spawn(filebrowser)
  end, { description = 'open filebrowser', group = 'launcher' }),

  awful.key({ modkey }, 'r', function()
    awful.spawn.with_shell '~/.config/rofi/launchers/type-1/launcher.sh'
    -- awful.spawn.with_shell 'rofi -show drun'
    -- awful.screen.focused().mypromptbox:run()
  end, { description = 'run prompt', group = 'launcher' }),
  -- awful.key({ modkey }, "p", function()
  -- 	menubar.show()
  -- end, { description = "show the menubar", group = "launcher" }),
}

function get_tag_at_offset(i)
  local s = screen[awful.screen.focused()]
  local tags = s.tags
  local showntags = {}
  for _, t in ipairs(tags) do
    if not awful.tag.getproperty(t, 'hide') then
      table.insert(showntags, t)
    end
  end
  local sel = s.selected_tag
  for k, t in ipairs(showntags) do
    if t == sel then
      return showntags[gears.math.cycle(#showntags, k + i)]
    end
  end
end

-- Tags related keybindings
awful.keyboard.append_global_keybindings {
  awful.key({ modkey }, 'Left', awful.tag.viewprev, { description = 'view previous', group = 'tag' }),
  awful.key({ modkey }, 'Right', awful.tag.viewnext, { description = 'view next', group = 'tag' }),
  awful.key {
    { modkey, 'Shift' },
    'Left',
    function()
      -- if client.focus then
      -- 	client.focus:move_to_tag(get_tag_at_offset(-1))
      -- end
      awful.tag.viewprev()
    end,
    { description = 'Move active client to next tag', group = 'client' },
  },
  awful.key {
    { modkey, 'Shift' },
    'Right',
    function()
      -- if client.focus then
      -- 	client.focus:move_to_tag(get_tag_at_offset(1))
      -- end
      awful.tag.viewprev()
    end,
    { description = 'Move active client to next tag', group = 'client' },
  },
  awful.key({ modkey }, 'Escape', awful.tag.history.restore, { description = 'go back', group = 'tag' }),
  -- Focus related keybindings
  awful.key({ modkey }, 'j', function()
    awful.client.focus.byidx(1)
  end, { description = 'focus next by index', group = 'client' }),

  awful.key({ modkey }, 'k', function()
    awful.client.focus.byidx(-1)
  end, { description = 'focus previous by index', group = 'client' }),

  awful.key({ modkey }, 'Tab', function()
    awful.client.focus.history.previous()
    if client.focus then
      client.focus:raise()
    end
  end, { description = 'go back', group = 'client' }),

  awful.key({ modkey }, '.', function()
    awful.screen.focus_relative(1)
  end, { description = 'focus the next screen', group = 'screen' }),

  awful.key({ modkey }, ',', function()
    awful.screen.focus_relative(-1)
  end, { description = 'focus the previous screen', group = 'screen' }),

  -- Layout related keybindings
  awful.key({ modkey, 'Shift' }, 'j', function()
    awful.client.swap.byidx(1)
  end, { description = 'swap with next client by index', group = 'client' }),
  awful.key({ modkey, 'Shift' }, 'k', function()
    awful.client.swap.byidx(-1)
  end, { description = 'swap with previous client by index', group = 'client' }),
  awful.key({ modkey, 'Control' }, 'j', function()
    awful.client.incwfact(-0.05)
  end, { description = 'increase master width factor', group = 'layout' }),
  awful.key({ modkey, 'Control' }, 'k', function()
    awful.client.incwfact(0.05)
  end, { description = 'decrease master width factor', group = 'layout' }),

  awful.key({ modkey }, 'u', awful.client.urgent.jumpto, { description = 'jump to urgent client', group = 'client' }),

  awful.key({ modkey }, 'l', function()
    awful.tag.incmwfact(0.05)
  end, { description = 'increase master width factor', group = 'layout' }),
  awful.key({ modkey }, 'h', function()
    awful.tag.incmwfact(-0.05)
  end, { description = 'decrease master width factor', group = 'layout' }),

  awful.key({ modkey, 'Shift' }, 'h', function()
    awful.tag.incnmaster(1, nil, true)
  end, { description = 'increase the number of master clients', group = 'layout' }),
  awful.key({ modkey, 'Shift' }, 'l', function()
    awful.tag.incnmaster(-1, nil, true)
  end, { description = 'decrease the number of master clients', group = 'layout' }),

  awful.key({ modkey, 'Control' }, 'h', function()
    awful.tag.incncol(1, nil, true)
  end, { description = 'increase the number of columns', group = 'layout' }),
  awful.key({ modkey, 'Control' }, 'l', function()
    awful.tag.incncol(-1, nil, true)
  end, { description = 'decrease the number of columns', group = 'layout' }),

  awful.key({ modkey }, 'space', function()
    awful.layout.inc(1)
  end, { description = 'select next', group = 'layout' }),
  awful.key({ modkey, 'Shift' }, 'space', function()
    awful.layout.inc(-1)
  end, { description = 'select previous', group = 'layout' }),

  awful.key({ modkey }, 'm', function()
    local t = awful.screen.focused().selected_tag
    if t then
      if t.layout == awful.layout.suit.max then
        t.layout = t.layouts[1] or t.layout
      else
        t.layout = awful.layout.suit.max
      end
    end
  end, { description = 'toggle monocle layout', group = 'layout' }),
  awful.key {
    modifiers = { modkey },
    keygroup = 'numrow',
    description = 'only view tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        tag:view_only()
      end
    end,
  },
  awful.key {
    modifiers = { modkey, 'Control' },
    keygroup = 'numrow',
    description = 'toggle tag',
    group = 'tag',
    on_press = function(index)
      local screen = awful.screen.focused()
      local tag = screen.tags[index]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end,
  },
  awful.key {
    modifiers = { modkey, 'Shift' },
    keygroup = 'numrow',
    description = 'move focused client to tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers = { modkey, 'Control', 'Shift' },
    keygroup = 'numrow',
    description = 'toggle focused client on tag',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end,
  },
  awful.key {
    modifiers = { modkey, 'Mod1', 'Shift' },
    keygroup = 'numrow',
    description = 'move focused client to tag and switch to it',
    group = 'tag',
    on_press = function(index)
      if client.focus then
        local tag = client.focus.screen.tags[index]
        if tag then
          client.focus:move_to_tag(tag)
          tag:view_only()
        end
      end
    end,
  },

  awful.key {
    modifiers = { modkey },
    keygroup = 'numpad',
    description = 'select layout directly',
    group = 'layout',
    on_press = function(index)
      local t = awful.screen.focused().selected_tag
      if t then
        t.layout = t.layouts[index] or t.layout
      end
    end,
  },
  awful.key({ modkey }, 'F5', function()
    awful.spawn "/bin/bash -c 'picom-opt on'"
  end, { description = 'Activate picom' }),
  awful.key({ modkey }, 'F7', function()
    awful.spawn '/bin/bash -c picom-opt'
  end, { description = 'Suspend picom' }),
}

client.connect_signal('request::default_mousebindings', function()
  awful.mouse.append_client_mousebindings {
    awful.button({}, 1, function(c)
      c:activate { context = 'mouse_click' }
    end),
    awful.button({ modkey }, 1, function(c)
      c:activate { context = 'mouse_click', action = 'mouse_move' }
    end),
    awful.button({ modkey }, 3, function(c)
      c:activate { context = 'mouse_click', action = 'mouse_resize' }
    end),
  }
end)

client.connect_signal('request::default_keybindings', function()
  awful.keyboard.append_client_keybindings {
    awful.key({ modkey }, 'f', function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end, { description = 'toggle fullscreen', group = 'client' }),

    awful.key({ modkey, 'Shift' }, 'c', function(c)
      c:kill()
    end, { description = 'close', group = 'client' }),

    awful.key({ modkey, 'Shift' }, 'f', awful.client.floating.toggle, { description = 'toggle floating', group = 'client' }),

    awful.key({ modkey }, 'Return', function(c)
      c:swap(awful.client.getmaster())
    end, { description = 'move to master', group = 'client' }),

    awful.key({ modkey, 'Shift' }, '.', function(c)
      c:move_to_screen()
    end, { description = 'move to next screen', group = 'client' }),

    awful.key({ modkey, 'Shift' }, ',', function(c)
      c:move_to_screen(c.screen.index - 1)
    end, { description = 'move to previous screen', group = 'client' }),

    -- awful.key({ modkey }, "t", function(c)
    -- 	c.ontop = not c.ontop
    -- end, { description = "toggle keep on top", group = "client" }),

    awful.key({ modkey }, 'n', function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end, { description = 'minimize', group = 'client' }),

    awful.key({ modkey, 'Control' }, 'n', function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:activate { raise = true, context = 'key.unminimize' }
      end
    end, { description = 'restore last minimized', group = 'client' }),

    awful.key({ modkey, 'Shift' }, 'm', function(c)
      c.maximized = not c.maximized
      c:raise()
    end, { description = 'toggle maximized', group = 'client' }),

    -- Load the widget.

    -- Configure the hotkeys.
    awful.key({ 'Ctrl' }, 'Print', scrot_full, { description = 'Take a screenshot of all screens', group = 'screenshot' }),
    awful.key({ modkey }, 'Print', scrot_selection, { description = 'Take a screenshot of selection', group = 'screenshot' }),
    awful.key({}, 'Print', scrot_window, { description = 'Take a screenshot of focused window', group = 'screenshot' }),
    -- awful.key({ 'Ctrl' }, 'Print', scrot_delay, { description = 'Take a screenshot of delay', group = 'screenshot' }),
    -- awful.key({ modkey, "Control" }, "m", function(c)
    -- 	c.maximized_vertical = not c.maximized_vertical
    -- 	c:raise()
    -- end, { description = "(un)maximize vertically", group = "client" }),
    -- awful.key({ modkey, "Shift" }, "m", function(c)
    -- 	c.maximized_horizontal = not c.maximized_horizontal
    -- 	c:raise()
    -- end, { description = "(un)maximize horizontally", group = "client" }),
  }
end)
