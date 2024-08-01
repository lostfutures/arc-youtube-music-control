on run argv
	if (count of argv) is 0 then
		return "Please provide a command: play, next, previous, info, or volume [level]"
	end if

	set command to item 1 of argv

	tell application "Arc"
		set foundTab to my findYouTubeMusicTab()
		if foundTab is not missing value then
			if command is "play" then
				return my playPause(foundTab)
			else if command is "next" then
				return my nextSong(foundTab)
			else if command is "previous" then
				return my previousSong(foundTab)
			else if command is "info" then
				return my getSongInfo(foundTab)
			else if command is "volume" then
				if (count of argv) > 1 then
					return my setVolume(foundTab, item 2 of argv)
				else
					return "Please specify a volume level (0-100)"
				end if
			else
				return "Unknown command. Available commands: play, next, previous, info, volume"
			end if
		else
			return "YouTube Music tab not found"
		end if
	end tell
end run

on findYouTubeMusicTab()
	tell application "Arc"
		repeat with w in windows
			repeat with t in tabs of w
				if URL of t is "https://music.youtube.com/" then
					select t
					return t
				end if
			end repeat
		end repeat
	end tell
	return missing value
end findYouTubeMusicTab

on playPause(theTab)
	tell application "Arc" to execute theTab javascript "document.querySelector('#play-pause-button').click()"
	return "Toggled play/pause"
end playPause

on nextSong(theTab)
	tell application "Arc" to execute theTab javascript "document.querySelector('.next-button').click()"
	return "Skipped to next song"
end nextSong

on previousSong(theTab)
	tell application "Arc" to execute theTab javascript "document.querySelector('.previous-button').click()"
	return "Skipped to previous song"
end previousSong

on getSongInfo(theTab)
	tell application "Arc"
		set songTitle to execute theTab javascript "document.querySelector('.ytmusic-player-bar.title').textContent"
		set artistInfo to execute theTab javascript "document.querySelector('.ytmusic-player-bar.byline').textContent"
	end tell
	return "Now playing: " & songTitle & " by " & artistInfo
end getSongInfo

on setVolume(theTab, volumeLevel)
	set jsCommand to "document.querySelector('#volume-slider').value = " & volumeLevel & "; document.querySelector('#volume-slider').dispatchEvent(new Event('change', { bubbles: true }));"
	tell application "Arc" to execute theTab javascript jsCommand
	return "Set volume to " & volumeLevel
end setVolume
