# Setup of the Lattepanda

## NUM LOCK on at startup

**BIOS**

From the BIOS, change in the Startup menu to switch on the Num Lock

**RegEdit Win10**

From the RegEdit change the value to 2 of the "InitialKeyboardIndicators" found at HKEY_USERS\.Default\Control Panel\Keyboard

![alt text](https://github.com/marclura/Radix-Escape-Rooms/raw/master/Setup%20process/num_lock_win10_setup.png "Num lock win10 regedit")

If it doesn't help, go ahead and change it for every other user HKEY_USERS\"any other users"\Control Panel\Keyboard\InitialKeyboardIndicators to 2.