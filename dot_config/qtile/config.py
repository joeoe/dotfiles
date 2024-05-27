from libqtile import bar, layout, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
import colors

mod = "mod4"
terminal = "kitty"
browser = "firefox"
# terminal = guess_terminal()

# A function for hide/show all the windows in a group


@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()

# A function for toggling between MAX and MONADTALL layouts


last_layout = ''


@lazy.function
def maximize_by_switching_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'max':
        # if last_layout != '':
        #     qtile.current_group.layout = last_layout
        # else:
        qtile.current_group.layout = layouts[0]
    else:
        last_layout = current_layout_name
        qtile.current_group.layout = 'max'


keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),
    Key([mod], "return", lazy.layout.swap_main(),
        desc="Swap window with main"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h",
        lazy.layout.grow_left().when(layout=["columns"]),
        lazy.layout.shrink().when(layout=["monadtall", "monadthreecol"]),
        desc="Grow window to the left"),
    Key([mod, "control"], "l",
        lazy.layout.grow_right().when(layout=["columns"]),
        lazy.layout.grow().when(layout=["monadtall", "monadthreecol"]),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Space", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "t", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Space", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "b", lazy.spawn(browser), desc="Browser"),
    Key([mod], "r", lazy.spawn("rofi -show drun"), desc="Launcher"),
    Key([mod], "m", maximize_by_switching_layout(), desc="Toggle Monocle"),

    # Switch focus of monitors
    Key([mod], "period", lazy.next_screen(),
        desc='Move focus to next monitor'),
    Key([mod], "comma", lazy.prev_screen(), desc='Move focus to prev monitor'),

    Key([mod], "escape", lazy.screen.toggle_group(), desc='Last active group'),
    Key([mod], "u", lazy.next_urgent(), desc='Next urgent window'),
]

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(
                func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )


groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            # mod1 + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + group number = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + group number = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

colors = colors.TomorrowNight

layout_theme = {"border_width": 2, "margin": 4,
                "border_normal": colors[0], "border_focus": colors[8]}
layouts = [
    layout.MonadThreeCol(**layout_theme, new_client_position='after_current'),
    layout.Columns(**layout_theme, insert_position=1, fair=False),
    layout.MonadTall(**layout_theme),
    layout.Max(border_width=0, margin=0),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font="Jetbrains Mono NF",
    fontsize=14,
    padding=2,
    background=colors[0]
)
extension_defaults = widget_defaults.copy()

space = 12
spacer = widget.Spacer(length=space)

spacer_text = widget.TextBox(
    text='|',
    font="Jetbrains Mono NF",
    foreground=colors[1],
    padding=2,
    fontsize=10
)


def bottom_border_decoration(colour):
    return [BorderDecoration(colour=colour, border_width=[0, 0, 2, 0],)]


def make_bar():
    return bar.Bar(
        [
            spacer,
            widget.GroupBox(fontsize=13,
                            margin_y=5,
                            margin_x=5,
                            padding_y=2,
                            padding_x=1,
                            borderwidth=3,
                            active=colors[8],
                            inactive=colors[1],
                            rounded=False,
                            highlight_color=colors[2],
                            highlight_method="line",
                            this_current_screen_border=colors[7],
                            this_screen_border=colors[4],
                            other_current_screen_border=colors[7],
                            other_screen_border=colors[4],
                            ),
            widget.Prompt(),
            spacer,
            widget.CurrentLayoutIcon(
                # custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                foreground=colors[1],
                # padding=4,
                scale=0.6
            ),
            widget.CurrentLayout(
                foreground=colors[1],
                padding=5
            ),
            spacer_text,
            widget.WindowName(
                foreground=colors[6],
                max_chars=40
            ),

            widget.Chord(
                chords_colors={
                    "launch": ("#ff0000", "#ffffff"),
                },
                name_transform=lambda name: name.upper(),
            ),
            widget.Volume(
                # foreground=colors[7],
                fmt='🕫  {}',
                decorations=bottom_border_decoration(colors[7]),
            ),

            spacer,
            # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
            # widget.StatusNotifier(),
            widget.Systray(padding=3),
            spacer,
            widget.Clock(format="%Y-%m-%d %a %H:%M",
                         decorations=bottom_border_decoration(colors[8]),
                         ),
            spacer,
        ],
        24,
        # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
        # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
    )


screens = [
    Screen(top=make_bar()),
    Screen(top=make_bar())
    # You can uncomment this variable if you see that on X11 floating resize/moving is laggy
    # By default we handle these events delayed to already improve performance, however your system might still be struggling
    # This variable is set to None (no cap) by default, but you can set it to 60 to indicate that you limit it to 60 events per second
    # x11_drag_polling_rate = 60,
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None


# @hook.subscribe.startup_once
# def start_once():
#     home = os.path.expanduser('~')
#     subprocess.call([home + '/.config/qtile/autostart.sh'])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
