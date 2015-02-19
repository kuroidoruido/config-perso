#!/bin/sh

player=$(playerctl -l 2> /dev/null)

if [[ $player != "" ]];then
	state=$(playerctl status)
	if [[ $state == "Stopped" ]]; then
		rm ~/.conky/k49Music/tmp
	else		
		#~ if [[ $1 == 'title' ]]; then
			
			function playPauseStopSymbol () {
				if [[  $1 == "Playing" ]]; then
					echo -e "\u25B6"
				elif [[ $1 == "Paused" ]]; then
					echo -e "\u00A0"
				elif [[ $1 == "Stopped" ]]; then
					echo "\u25AA"
				fi
			}
			
			trackNumber=$(playerctl metadata xesam:trackNumber)
			title=$(playerctl metadata title)
			
			echo '${goto 20}${font Monospace:bold:size=10}'$(playPauseStopSymbol $state) $trackNumber - $title'${font}'
		
		#~ elif [[ $1 == 'desktop' ]]; then
			
			artist=$(playerctl metadata artist)
			album=$(playerctl metadata xesam:album)
			coverURI=$(playerctl metadata mpris:artUrl | sed 's/file:\/\///')
			
			#~ echo ''
			echo '${goto 110}'$artist
			echo '${goto 110}'$album
			cp $coverURI ~/.conky/k49Music/tmp
		
		#~ fi
	fi
fi
