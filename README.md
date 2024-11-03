# Radix-Escape-Rooms
 2024

## Setup

### BIOS
- Add a password to the BIOS (setup only)
- Activate NumLock
- Set "Power Off" after AC failure

### Windows setup
- Change the power settings to never power off the screen and the device
- Change the power button behaviour to the option power off
- Disable the Wifi
- Disable the BLE
- Remove unusued items form the Task Manager > Startup
- (Add French as language and set it as keyboard layout)
- Disable all items in Privacy settings (out of the Microphone access, else Processing Java will not work)
- Activate Windows

### NumLock settings
- Run the `registry editor` as administrator, and go to this path `HKEY_CURRENT_USER\Control Panel\Keyboard` and `HKEY_USERS.Default\Control Panel\Keyboard`.
- Check the other USERS for the same same entry and change it if it doesn't work with the indicated user.
- Edit the `InitialKeyboardIndicators` to `2147483650`.
- Switch ON the NumLock
- Switch Off the computer (not Reboot, but power off).
- Now it should stay on. It will keep the last current NumLock status before power off

### Windows Users
- Create a new user without admin privileges and without password (the main auto-login account)
- Add a password to the admin account
- Install the programs from the admin account, but open them from the user account to set them up there


### Installation specific
- Install processing. Install the official video and sound libraries in the user account.
- Flash the Lattepanda Arduino Leonardo (COM3) with the Arduino code of the repo.
- Load the video, audio, etc. files in the Processing sketch data folder
- In windows Settings/Privacy/Microphone let programs access the mic else Java won't work
- Set the number of the escape room in the Processing sketch
- Edit the `start.bat` file match your environment and place it in the folder that opens with the run commmand `shell:startup` (Win+R keys)
- Once plugged all the screens etc, forse the audio output via the headphone jack (delete the other HDMI audio interfaces)