#!/bin/fish

set player (playerctl status 2> /dev/null)

if test -z "$player"
    spotify &
end

playerctl play-pause
