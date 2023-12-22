#!/bin/fish
set start "%{T2}"

set play_pause_symbol 
set song_name (playerctl metadata --format "{{trunc(title, 25)}}" -p spotify 2> /dev/null)
if [ $song_name != "" ]
    set song_name (string join " " "%{T0}" $song_name "%{T-}")
end

set status_pp (playerctl status)
if [ $status_pp = "Playing" ]
    set play_pause_symbol 
else if [ $status_pp = "Playing" ]
    set play_pause_symbol 
end

set previous "%{A1:$SCRIPTPATH/scripts/musiquinha/previous_musiquinha.fish:}󰼨%{A}"
set play_pause (string join " " "%{A1:$SCRIPTPATH/scripts/musiquinha/start_musiquinha.fish:}" $play_pause_symbol "%{A}")
set next "%{A1:$SCRIPTPATH/scripts/musiquinha/next_musiquinha.fish:}󰼧%{A}"
set end "%{T-}"
echo (string join "" $start $previous $play_pause $next $song_name $end)
