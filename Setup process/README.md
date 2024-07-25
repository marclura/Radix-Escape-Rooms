# Setup of the Lattepanda

## NUM LOCK on at startup

**BIOS**

From the BIOS, change in the Startup menu to switch on the Num Lock

**RegEdit Win10**

From the RegEdit change the value to 2 of the "InitialKeyboardIndicators" found at HKEY_USERS\.Default\Control Panel\Keyboard

![alt text](https://github.com/marclura/Radix-Escape-Rooms/raw/master/Setup%20process/num_lock_win10_setup.png "Num lock win10 regedit")

Go ahead and change it for every other user HKEY_USERS\"any other users"\Control Panel\Keyboard\InitialKeyboardIndicators to 2.

**Disable fast startup**

From Control Panel\Hardware and Sound\Power Options\System Settings disable the "Turn on fast startup option"

**Reboot setup**

Do the previous steps (BIOS, RegEdit, Fast Startup), then power off the PC, power it on and activate the Num Lock key if not active **before login**.

Login on every account you need the Num Lock active, activate it, and power off and on the PC. Num Lock should now stay on all the time now.
