# Radix-Escape-Rooms
 2024

## Setup

### Lattepanda
- Create a new user without admin privileges and without password (the main auto-login account)
- Add a password to the admin account
- Install the programs from the admin account, but open them from the user account to set them up there
- Change the power settings to never power off the screen and the device
- Change the power button behaviour to the option power off

### Installation setup
- Install processing. Install the official video and sound libraries in the user account.
- Flash the Lattepanda Arduino Leonardo (COM3) with the Arduino code of the repo.
- Load the video, audio, etc. files in the Processing sketch data folder
- Set the number of the escape room in the Processing sketch
- Edit the `start.bat` file match your environment and place it in the folder that opens with the run commmand `shell:startup` (Win+R keys)
- Once plugged all the screens etc, forse the audio output via the headphone jack (delete the other HDMI audio interfaces)
