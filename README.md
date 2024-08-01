# YouTube Music Control for Arc Browser

This AppleScript allows you to control YouTube Music playing in the Arc browser. It provides functionality to play/pause, skip tracks, get song information, and adjust volume.

## Usage

There are several ways to use this script:

### 1. Direct AppleScript Execution

You can run the script directly from the terminal using the `osascript` command:

```bash
osascript /path/to/YouTubeMusicControl.scpt [command]
Available commands:
	•	play: Toggle play/pause
	•	next: Skip to next track
	•	previous: Go to previous track
	•	info: Get current song information
	•	volume [0-100]: Set volume level
Examples:

osascript YouTubeMusicControl.scpt play
osascript YouTubeMusicControl.scpt next
osascript YouTubeMusicControl.scpt info
osascript YouTubeMusicControl.scpt volume 50
2. Alfred Workflow
You can create an Alfred workflow to control YouTube Music:
	1.	Create a new workflow in Alfred
	2.	Add a "Hotkey" input
	3.	Connect it to a "Run Script" action
	4.	In the script box, use:

osascript /path/to/YouTubeMusicControl.scpt {query}
	5.	In Alfred, you can now type commands like:

ytm play
ytm next
ytm info
ytm volume 75

3. Hammerspoon Integration
For global hotkeys and native macOS notifications, you can use Hammerspoon:
	1.	Install Hammerspoon
	2.	Add the provided Lua script to your Hammerspoon configuration
	3.	Reload Hammerspoon
Default hotkeys:
	•	Cmd + Alt + P: Play/Pause
	•	Cmd + Alt + N: Next track
	•	Cmd + Alt + B: Previous track
	•	Cmd + Alt + I: Get song info
	•	Cmd + Alt + Up: Increase volume
	•	Cmd + Alt + Down: Decrease volume
4. Shell Alias
For quick terminal access, add an alias to your shell configuration file (e.g., .bashrc or .zshrc):

alias ytm="osascript /path/to/YouTubeMusicControl.scpt"
Then you can use:

ytm play
ytm next
ytm info
Requirements
	•	macOS
	•	Arc Browser
	•	YouTube Music open in an Arc tab
Customization
Feel free to modify the AppleScript or the Hammerspoon configuration to suit your needs. You can add more commands or change the hotkeys as desired.


This README provides a comprehensive overview of different ways to use the AppleScript, from direct terminal execution to integration with tools like Alfred and Hammerspoon. It also includes a brief section on requirements and customization options. You can adjust or expand this README as needed to better fit your specific implementation or to add more detailed instructions.