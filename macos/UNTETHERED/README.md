# Nature of this iBoot exploit

## nvram
This tool changes the nvram value and triggers an exploit. Therefore, if this tool is not properly released after use, the normal firmware will trigger a recovery mode.

## How to cancel a trigger of exploit
### iPhone 4
Put in device to DFU mode, cd to remove_for_i4 via terminal and execute disable

### iPhone 4s~iPhone 5c
Restore to iOS 9.3.5/10.3.4, and jailbreak, and execute "nvram -d boot-ramdisk" via terminal.
//TODO, An easier way
