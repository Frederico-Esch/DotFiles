#!/bin/fish
function reload_polybar
	set -x SCRIPTPATH /home/fred/.config/leftwm/themes/current
	killall -q polybar

	set index 0
	set monitors (polybar -m | sed 's/:.*//')

	leftwm-state -q -n -t $SCRIPTPATH/sizes.liquid | sed -r '/^\s*$/d' | while read -l width x y
	  set barname "mainbar$index"
	  set monitor $monitors[(math $index+1)]
	  set width (math $width - 16 )
	  polybar -c $SCRIPTPATH/polybar.config $barname &> /dev/null &; disown
	  set index index+1
  	end
end
