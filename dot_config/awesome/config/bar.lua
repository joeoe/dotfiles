local gears = require 'gears'
local awful = require 'awful'
local wibox = require 'wibox'
local beautiful = require 'beautiful'

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
mytextclock = wibox.widget.textclock()

beautiful.systray_icon_spacing = 12

local theme = beautiful.get()
local taglist_bg_hover = theme.taglist_bg_hover
local taglist_fg_hover = theme.taglist_fg_hover

screen.connect_signal('request::desktop_decoration', function(s)
  -- Each screen has its own tag table.
  awful.tag({ '1', '2', '3', '4', '5', '6', '7', '8', '9' }, s, awful.layout.layouts[1])

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({}, 1, function()
        awful.layout.inc(1)
      end),
      awful.button({}, 3, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 4, function()
        awful.layout.inc(-1)
      end),
      awful.button({}, 5, function()
        awful.layout.inc(1)
      end),
    },
  }

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = {
      awful.button({}, 1, function(t)
        t:view_only()
      end),
      awful.button({ modkey }, 1, function(t)
        if client.focus then
          client.focus:move_to_tag(t)
        end
      end),
      awful.button({}, 3, awful.tag.viewtoggle),
      awful.button({ modkey }, 3, function(t)
        if client.focus then
          client.focus:toggle_tag(t)
        end
      end),
      awful.button({}, 4, function(t)
        awful.tag.viewprev(t.screen)
      end),
      awful.button({}, 5, function(t)
        awful.tag.viewnext(t.screen)
      end),
    },
    widget_template = {
      {
        {
          {
            {
              {
                id = 'text_role',
                widget = wibox.widget.textbox,
              },
              margins = 4,
              widget = wibox.container.margin,
            },
            -- bg = '#dddddd',
            -- shape = gears.shape.circle,
            widget = wibox.container.background,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left = 8,
        right = 8,
        widget = wibox.container.margin,
      },
      id = 'background_role',
      widget = wibox.container.background,
      -- Add support for hover colors and an index label
      -- create_callback = function(self, c3, index, objects) --luacheck: no unused args
      --   self:connect_signal('mouse::enter', function()
      --     if self.bg ~= taglist_bg_hover then
      --       self.backup_bg = self.bg
      --       self.backup_fg = self.fg
      --       self.has_backup = true
      --     end
      --     self.bg = taglist_bg_hover
      --     self.fg = taglist_fg_hover
      --   end)
      --   self:connect_signal('mouse::leave', function()
      --     if self.has_backup then
      --       self.bg = self.backup_bg
      --       self.fg = self.backup_fg
      --     end
      --   end)
      -- end,
    },
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    style = {
      -- border_width = 2,
      -- border_color =
      -- shape = gears.shape.rounded_rect,
    },
    buttons = {
      awful.button({}, 1, function(c)
        c:activate { context = 'tasklist', action = 'toggle_minimization' }
      end),
      awful.button({}, 3, function()
        awful.menu.client_list { theme = { width = 250 } }
      end),
      awful.button({}, 4, function()
        awful.client.focus.byidx(-1)
      end),
      awful.button({}, 5, function()
        awful.client.focus.byidx(1)
      end),
    },
    layout = {
      spacing = 6,
      -- spacing_widget = {
      -- {
      --   forced_width = 8,
      --   -- shape = gears.shape.circle,
      --   widget = wibox.widget.separator,
      -- },
      --   valign = 'center',
      --   halign = 'center',
      --   widget = wibox.container.place,
      -- },
      layout = wibox.layout.flex.horizontal,
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
      {
        {
          {
            {
              id = 'icon_role',
              widget = wibox.widget.imagebox,
            },
            left = 4,
            right = 6,
            top = 1,
            bottom = 1,
            widget = wibox.container.margin,
          },
          {
            id = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        left = 8,
        right = 8,
        top = 2,
        bottom = 2,
        widget = wibox.container.margin,
      },
      id = 'background_role',
      widget = wibox.container.background,
    },
  }

  -- Create the wibox
  s.mywibox = awful.wibar {
    position = 'top',
    screen = s,
    widget = {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        -- mylauncher,
        {
          s.mytaglist,
          widget = wibox.container.margin,
          left = 4,
          right = 12,
        },
        s.mypromptbox,
      },
      s.mytasklist, -- Middle widget
      { -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        mykeyboardlayout,
        wibox.widget.systray(),
        mytextclock,
        s.mylayoutbox,
      },
    },
  }
end)
