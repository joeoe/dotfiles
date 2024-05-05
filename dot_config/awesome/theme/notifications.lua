local awful = require 'awful'
local ruled = require 'ruled'
local naughty = require 'naughty'
local gears = require 'gears'
local beautiful = require 'beautiful'
local wibox = require 'wibox'
local xresources = require 'beautiful.xresources'
local dpi = xresources.apply_dpi

naughty.config.defaults.ontop = true
naughty.config.defaults.screen = awful.screen.focused()
naughty.config.defaults.position = 'top_right'
naughty.config.defaults.title = 'Notification'
naughty.config.defaults.border_width = dpi(1)
naughty.config.defaults.timeout = 5

ruled.notification.connect_signal('request::rules', function()
  ruled.notification.append_rule {
    rule = { urgency = 'critical' },
    properties = {
      bg = beautiful.bg_urgent,
      fg = beautiful.fg_normal,
      timeout = 20,
    },
  }

  -- Normal
  ruled.notification.append_rule {
    rule = { urgency = 'normal' },
    properties = {
      bg = beautiful.bg_normal,
      fg = beautiful.fg_normal,
      timeout = 5,
    },
  }

  -- Low
  ruled.notification.append_rule {
    rule = { urgency = 'low' },
    properties = {
      bg = beautiful.bg_normal,
      fg = beautiful.fg_normal,
      timeout = 5,
    },
  }
end)

naughty.connect_signal('request::display', function(n)
  naughty.layout.box {
    notification = n,
    type = 'notification',
    bg = beautiful.bg_normal,
    widget_template = {
      {
        {
          {
            {
              {
                {
                  naughty.widget.title,
                  forced_height = dpi(20),
                  layout = wibox.layout.align.horizontal,
                },
                left = dpi(15),
                right = dpi(15),
                top = dpi(10),
                bottom = dpi(10),
                widget = wibox.container.margin,
              },
              bg = beautiful.bg_focus,
              widget = wibox.container.background,
            },
            strategy = 'min',
            width = dpi(300),
            widget = wibox.container.constraint,
          },
          strategy = 'max',
          width = dpi(400),
          widget = wibox.container.constraint,
        },
        {
          {
            {
              naughty.widget.message,
              left = dpi(15),
              right = dpi(15),
              top = dpi(15),
              bottom = dpi(15),
              widget = wibox.container.margin,
            },
            strategy = 'min',
            height = dpi(60),
            widget = wibox.container.constraint,
          },
          strategy = 'max',
          width = dpi(400),
          widget = wibox.container.constraint,
        },
        {
          wibox.widget {
            notification = n,
            base_layout = wibox.widget {
              spacing = dpi(0),
              layout = wibox.layout.flex.horizontal,
            },
            widget_template = {
              {
                {
                  {
                    {
                      id = 'text_role',
                      font = 'MonoLisa',
                      widget = wibox.widget.textbox,
                    },
                    widget = wibox.container.place,
                  },
                  widget = wibox.container.background,
                  bg = beautiful.bg_normal,
                },
                bg = beautiful.groups_bg,
                shape = gears.shape.rounded_rect,
                forced_height = dpi(30),
                widget = wibox.container.background,
              },
              margins = dpi(6),
              widget = wibox.container.margin,
            },
            style = { underline_normal = false, underline_selected = true },
            widget = naughty.list.actions,
          },
          widget = wibox.container.margin,
          top = 0,
          bottom = 5,
          left = 10,
          right = 10,
        },
        layout = wibox.layout.align.vertical,
      },
      id = 'background_role',
      widget = naughty.container.background,
    },
  }
end)
