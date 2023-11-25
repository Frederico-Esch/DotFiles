#!/bin/python3

import gi
import os
gi.require_version("Playerctl", "2.0")
from gi.repository import Playerctl, GLib
from subprocess import run

#scriptpath = os.path.realpath(__file__)
#scriptpath = os.environ.get("SCRIPTPATH")
manager = Playerctl.PlayerManager()

#run(["notify-send", scriptpath])
def update_polybar_musiquinha():
    run(["polybar-msg", "action", "#musiquinha.hook.0"])

def on_play(player, status, manager):
    update_polybar_musiquinha()

def on_pause(player, status, manager):
    update_polybar_musiquinha()

def on_metadata(player, metadata, manager):
    update_polybar_musiquinha()

def init_player(name):
    if name.name == "spotify":
        player = Playerctl.Player.new_from_name(name)
        player.connect('playback-status::playing', on_play, manager)
        player.connect('playback-status::paused', on_pause, manager)
        player.connect('metadata', on_metadata, manager)
        manager.manage_player(player)


def on_name_appeared(manager, name):
    init_player(name)


def on_player_vanished(manager, player):
    update_polybar_musiquinha()


manager.connect('name-appeared', on_name_appeared)
manager.connect('player-vanished', on_player_vanished)

for name in manager.props.player_names:
    init_player(name)


main = GLib.MainLoop()
main.run()
