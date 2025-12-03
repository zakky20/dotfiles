# Imports
import os, sys, re, subprocess, socket, colors
from libqtile import bar, extension, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy

# Variables
mod = "mod4"
terminal = "alacritty"
launcher = "rofi -show drun"
browser = "zen"
discord = "discord"
music = "spotify"
files = "thunar"
nitrogen = "nitrogen"
emacs = "emacsclient -c -a 'emacs'"

# Script Variables
bookmarks = "/usr/local/bin/bookmarks"
emoji = "/usr/local/bin/emoji"
notflix = "/usr/local/bin/notflix"
record = "/usr/local/bin/record"
getwallpaper = "/usr/local/bin/getwallpaper"
powermenu = "/usr/local/bin/powermenu"
record = "/usr/local/bin/record"
screenshot = "/usr/local/bin/screenshot"

# Lazy Functions
@lazy.layout.function
def add_treetab_section(layout):
    prompt = qtile.widgets_map["prompt"]
    prompt.start_input("Section name: ", layout.cmd_add_section)

@lazy.function
def minimize_all(qtile):
    for win in qtile.current_group.windows:
        if hasattr(win, "toggle_minimize"):
            win.toggle_minimize()

@lazy.function
def maximize_by_switching_layout(qtile):
    current_layout_name = qtile.current_group.layout.name
    if current_layout_name == 'monadtall':
        qtile.current_group.layout = 'max'
    elif current_layout_name == 'max':
        qtile.current_group.layout = 'monadtall'

# Keybindings
keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_up(), desc="Move window to the left"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_down(), desc="Move window to the right"),

    Key([mod, "control"], "h", lazy.layout.grow(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.shrink(), desc="Grow window to the right"),
    
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Terminal"),
    Key([mod], "d", lazy.spawn(launcher), desc="App launcher"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.spawn(browser), desc="Web browser"),
    Key([mod], "x", lazy.spawn(files), desc="File manager"),
    Key([mod], "c", lazy.spawn(discord), desc="Discord"),
    Key([mod], "s", lazy.spawn(music), desc="Spotify"),
    Key([mod, "shift"], "w", lazy.spawn(nitrogen), desc="Wallpaper Menu"),
    Key([mod, "shift"], "e", lazy.spawn(emacs), desc="Text Editor"),
    Key([], "Prior", lazy.spawn("flameshot gui"), desc="Screenshot Tool"),
    
    Key([mod], "b", lazy.spawn(bookmarks), desc="bookmarks script"),
    Key([mod], "e", lazy.spawn(emoji), desc="emoji script"),
    Key([mod, "shift"], "t", lazy.spawn(notflix), desc="notflix script"),
    Key([mod], "r", lazy.spawn(record), desc="record script"),
    Key([mod], "p", lazy.spawn(screenshot), desc="screenshot script"),
    Key([mod], "g", lazy.spawn(getwallpaper), desc="getwallpaper script"),
    Key([mod, "shift"], "p", lazy.spawn("rofi -show power-menu -modi power-menu:rofi-power-menu"), desc="powermenu script"),

    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "m", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod, "shift", "control"], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume 0 +5%"), desc='Volume Up'),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume 0 -5%"), desc='volume down'),

    Key([mod, "shift"], "h",
        lazy.layout.shuffle_left(),
        lazy.layout.move_left().when(layout=["treetab"]),
        desc="Move window to the left/move tab left in treetab"),

    Key([mod, "shift"], "l",
        lazy.layout.shuffle_right(),
        lazy.layout.move_right().when(layout=["treetab"]),
        desc="Move window to the right/move tab right in treetab"),

    Key([mod, "shift"], "j",
        lazy.layout.shuffle_down(),
        lazy.layout.section_down().when(layout=["treetab"]),
        desc="Move window down/move down a section in treetab"
    ),
    Key([mod, "shift"], "k",
        lazy.layout.shuffle_up(),
        lazy.layout.section_up().when(layout=["treetab"]),
        desc="Move window downup/move up a section in treetab"
    ),
]

# Groups
groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", ]
# group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9",]
group_labels = ["", "", "", "", "", "", "", "",]
group_layouts = [
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
]

# For's
for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        )
    )

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=False),
                desc="Move focused window to group {}".format(i.name),
            ),
      ]
)

# Colorscheme
colors = colors.Nord

# Layout Theme
layout_theme = {
    "border_width": 0,
    "margin": 15,
    "border_focus": colors[6],
    "border_normal": colors[0],
    "grow_amount": 2,
}

# Layouts
layouts = [
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Tile(**layout_theme),
    layout.Floating(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Plasma(**layout_theme),
    layout.Stack(**layout_theme),
    layout.Zoomy(**layout_theme),
]

# Widget Defaults
widget_defaults = dict(
    font="Iosevka Nerd Font Bold",
    fontsize = 14,
    padding = 3,
    background=colors[0]
)

# Search Widget
def search() -> None:
    qtile.cmd_spawn("rofi -show drun"),

# Widgets
def init_widgets_list():
    widgets_list = [
        widget.Image(
            filename = f"~/.config/qtile/assets/genchu.png",
            background = colors[0],
            margin_y = 7,
            margin_x = 5,
            mouse_callbacks = {
                "Button1": lambda: qtile.cmd_spawn(
                    "xdg-open https://wiki.gentoo.org/wiki/Main_Page"
                )
            },
        ),

        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 31,
                 ),

        widget.GroupBox(
                 margin_y = 2,
                 margin_x = 7,
                 padding_y = 0,
                 padding_x = 3,
                 borderwidth = 3,
                 background = colors[10],
                 active = colors[7],
                 inactive = colors[9],
                 rounded = True,
                 highlight_color = colors[1],
                 highlight_method = "text",
                 this_current_screen_border = colors[6],
                 this_screen_border = colors [4],
                 disable_drag = True,
                 ),

         widget.TextBox(
                 text = "󰿟",
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 58,
                 ),

        widget.CurrentLayout(
                 foreground = colors[6],
                 background = colors[10],
                 mode = "both",
                 icon_first = True,
                 custom_icon_paths = [f"/home/zakky/.config/qtile/assets/layout/"],
                 scale = 0.4,
                 padding = 5,
                 ),

        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 40,
                 ),

        widget.TextBox(
                 text = "  Search",
                 background = colors[0],
                 foreground = colors[7],
                 padding = 10,
                 mouse_callbacks = {"Button1": search},
                 ),

         widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 33,
                 ),

        widget.WindowName(
                 foreground = colors[6],
                 background = colors[10],
                 padding = 10,
                 max_chars = 65,
                 format = "{name}",
                 empty_group_string="Desktop",
                 ),

        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 33,
                 ),

        widget.Systray(
                 icon_size = 16,
                 padding = 5,
                 ),

        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 50,
                 ),

        widget.CPU(
                 background = colors[10],
                 foreground = colors[6],
                 padding = 3, 
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e btop')},
                 format = '  {load_percent}%',
                 ),

        widget.TextBox(
                 text = '󰿟',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 57,
                 ),

        widget.Memory(
                 background = colors[10],
                 foreground = colors[6],
                 padding = 3,
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e btop')},
                 format = "{NotAvailable: .0f} {mm}B",
                 fmt = ' {}',
                 ),

        widget.TextBox(
                 text = '󰿟',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 57,
                 ),

        widget.PulseVolume(
                 background = colors[10],
                 foreground = colors[6],
                 padding = 3,
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('pavucontrol')},
                 fmt = '  {}',
                 ),

        widget.TextBox(
                 text = '󰿟',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 57,
                 ),

        widget.Clock(
                 background = colors[10],
                 foreground = colors[6],
                 padding = 3, 
                 format = "  %d %b",
                 ),

         widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[10],
                 padding = 0,
                 fontsize = 50,
                 ),

         widget.Clock(
                 background = colors[0],
                 foreground = colors[7],
                 padding = 3, 
                 format = "󰥔  %R ",
                 ),
    ]
    return widgets_list

# Bars
# def init_screens():
#     return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), margin=[0, 0, 0, 0], size=25)),
#             Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[0, 0, 0, 0], size=25)),
#             Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[0, 0, 0, 0], size=25))]

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), margin=[17, 135, 5, 135], size=40)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[17, 135, 5, 135], size=40)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[17, 135, 5, 135], size=40))]

# Widget Screen
def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1 

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    del widgets_screen2[16:17]
    return widgets_screen2

# Def's
if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widgets_screen2 = init_widgets_screen2()

def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)

def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)

def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)

def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)

def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)

# Mouse
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Options
dgroups_key_binder = None
dgroups_app_rules = [] 
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True
floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"), 
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),  
        Match(wm_class="ssh-askpass"), 
        Match(title="branchdialog"), 
        Match(title="pinentry"), 
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wl_xcursor_theme = None
wl_xcursor_size = 24

# Autostart Scripts
@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# Window Manager Name
wmname = "qtile"
