#!/bin/fish

set argc (count $argv)

if [ $argc -le 0 ]; or [ $argc -ge 3 ]
    echo "Only <brightness>, <monitor> <brightness> or \"list\" arguments allowed"
    return
end

set monitors (xrandr --listmonitors | grep " [0-9]:.*")
set n_monitors (count $monitors)

set selected_monitor (string split ' ' $monitors[1])
if [ $argc = 2 ]
    math "0+$argv[1]" &>/dev/null
    if test $status -ne 0
        echo "<monitor> is a number"
        return
    end

    if [ $argv[1] -ge 1 ]; and [ $argv[1] -le $n_monitors ]
        set selected_monitor $monitors[$argv[1]]
        set brightness $argv[2]
    else
        echo "<monitor> is bigger than the amount of monitors found by xrandr"
        return
    end
else

    if [ "list" = $argv[1] ]
        for i in (seq 1 $n_monitors)
            set -l c_monitor (string split ' ' $monitors[$i])[-1]
            echo "$i: $c_monitor"
        end
        return
    end

    set brightness $argv[1]
end

math "0+$brightness" &>/dev/null
if test $status -ne 0
    echo "<brightness> needs to be a number"
    return
end

if [ $brightness -gt 1 ]; or [ $brightness -le 0 ]
    echo "<brightness> should be in the range ]0,1]"
    return
end

set selected_monitor (string split ' ' $selected_monitor)[-1]
xrandr --output $selected_monitor --brightness $brightness
echo "brightness of $selected_monitor set to $brightness"

