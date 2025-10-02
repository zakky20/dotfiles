import os, sys, re, subprocess, socket, colors
from libqtile import bar, extension, hook, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from typing import List

mod = "mod4"
terminal = "alacritty"
browser = "firefox"
neovim = "nvim"
vesktop = "vesktop"
music = "spotify"
files = "thunar"
emacs = "emacsclient -c -a 'emacs'"
wallpaperscript = "/usr/local/bin/randomwallpaper"
bookmarks = "/usr/local/bin/bookmarks"

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

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Terminal"),
    Key([mod], "d", lazy.spawn("rofi -show drun -show-icons"), desc="App launcher"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.spawn(browser), desc="Web browser"),
    Key([mod], "x", lazy.spawn(files), desc="File manager"),
    Key([mod], "c", lazy.spawn(vesktop), desc="vesktop"),
    Key([mod], "s", lazy.spawn(music), desc="spotify"),
    Key([mod], "e", lazy.spawn(emacs), desc="emacs"),
    Key([mod], "g", lazy.spawn(wallpaperscript), desc="random wallpaper"),
    Key([mod], "b", lazy.spawn(bookmarks), desc="bookmarks script"),
    
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "m", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

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

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
# group_labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_labels = ["www", "dev", "chat", "mus", "doc", "vid", "sys", "gfx", "misc"]
# group_labels = [" ", " ", " ", " ", " ", " ", " ", " ", ""]
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

colors = colors.Nord

layout_theme = {
    "border_width": 3,
    "margin": 10,
    "border_focus": colors[6],
    "border_normal": colors[0],
}

layouts = [
    layout.Max(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.Tile(**layout_theme),
    layout.Spiral(**layout_theme),
    layout.Floating(**layout_theme),
]

widget_defaults = dict(
    font="Iosevka Nerd Font Bold",
    fontsize = 14,
    padding = 10,
    background=colors[0]
)

extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
        widget.Spacer(length = 0),
        widget.Prompt(
                 font = "Iosevka Nerd Font Bold",
                 fontsize=14,
                 foreground = colors[1]
        ),
       # widget.Image(
       #          filename = "~/.config/qtile/icons/nix.png",
       #          scale = "false",
       #          background = colors[0],
       #          mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("qtilekeys-yad")},
       #  ),
       #  widget.TextBox(
       #           text = '',
       #           font = "Iosevka Nerd Font Bold",
       #           foreground = colors[2],
       #           background = colors[0],
       #           padding = 0,
       #           fontsize = 30,
       #           ),
        widget.GroupBox(
                 # fontsize = 16,
                 margin_y = 2,
                 margin_x = 7,
                 padding_y = 0,
                 padding_x = 2,
                 borderwidth = 3,
                 background = colors[2],
                 active = colors[6],
                 inactive = colors[1],
                 rounded = False,
                 highlight_color = colors[0],
                 highlight_method = "text",
                 this_current_screen_border = colors[8],
                 this_screen_border = colors [4],
                 ),
         # widget.CurrentLayout(
         #         foreground = colors[1],
         #         background = colors[2],
         #         padding = 1,
         #         fmt = "   {} ",
         #         ),
         widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[2],
                 background = colors[0],
                 padding = 0,
                 fontsize = 31,
                 ),
        widget.WindowName(
                 foreground = colors[1],
                 background = colors[0],
                 padding = 7,
                 max_chars = 70
                 ),
        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[2],
                 background = colors[0],
                 padding = 0,
                 fontsize = 30,
                 ),
         widget.GenPollText(
                 update_interval = 300,
                 func = lambda: subprocess.check_output("printf $(uname -r)", shell=True, text=True),
                 background = colors[2],
                 foreground = colors[1],
                 padding = 7,
            fmt = '  {}',
                 ),
        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[2],
                 padding = 0,
                 fontsize = 30,
                 ),
        widget.CPU(
                 background = colors[0],
                 foreground = colors[1],
                 padding = 7 , 
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e btop')},
            format = '  cpu: {load_percent}%',
                 ),
        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[2],
                 background = colors[0],
                 padding = 0,
                 fontsize = 30,
                 ),
        widget.Memory(
                 background = colors[2],
                 foreground = colors[1],
                 padding = 7 ,
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e btop')},
                 format = '{MemUsed: .0f} {mm}B',
            fmt = '  mem:{}',
                 ),
       widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[2],
                 padding = 0,
                 fontsize = 30,
                 ), 
        widget.DF(
                 update_interval = 60,
                 background = colors[0],
                 foreground = colors[1],
                 padding = 7 , 
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('notify-disk')},
                 partition = '/',
                 format = '{uf} {m}B',
            fmt = '󰋊  disk: {}',
                 visible_on_warn = False,
                 ),
        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[2],
                 background = colors[0],
                 padding = 0,
                 fontsize = 30,
                 ),
        widget.Volume(
                 background = colors[2],
                 foreground = colors[1],
                 padding = 7,
            fmt = '  vol: {}',
                 ),
        widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[0],
                 background = colors[2],
                 padding = 0,
                 fontsize = 30,
                 ),
        widget.Clock(
                 background = colors[0],
                 foreground = colors[1],
                 padding = 7, 
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('notify-date')},
            format = "  date: %b %d",
        ),
         widget.TextBox(
                 text = '',
                 font = "Iosevka Nerd Font Bold",
                 foreground = colors[2],
                 background = colors[0],
                 padding = 0,
                 fontsize = 30,
                 ),
         widget.Clock(
                 background = colors[2],
                 foreground = colors[1],
                 padding = 7, 
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('notify-date')},
            format = "󰥔  time: %R",
        ),
        ]
    return widgets_list

def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1 

def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    del widgets_screen2[16:17]
    return widgets_screen2

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen1(), margin=[8, 10, 1, 10], size=37)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[8, 10, 1, 10], size=37)),
            Screen(top=bar.Bar(widgets=init_widgets_screen2(), margin=[8, 10, 1, 10], size=37))]

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

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = True
floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
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
auto_minimize = True
wl_input_rules = None
wl_xcursor_theme = None
wl_xcursor_size = 24

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

wmname = "qtile"
