#!/bin/fish

set player (playerctl status -p spotify 2> /dev/null)

if test -z "$player"
    spotify &
end

playerctl play-pause -p spotify
