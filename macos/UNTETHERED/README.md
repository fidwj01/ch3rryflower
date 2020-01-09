# ch3rryflower [UNTETHER] - v1.3 beta 4-2  
by @dora2_yuruyi  

# What tool is this?
- This is an untethered downgrade CLI tool for 32-bit iOS devices with iOS 7 SHSH blobs using CFW.  

## Supported devices
- iPhone 4 (iPhone3,1)  
- iPhone 5 (iPhone5,2)  *Require iOS 7.x SHSH  
- iPhone 5c (iPhone5,3) *Require iOS 7.1.x SHSH  

## Supported environment
- macOS 10.13 or later  
- ubuntu 18.04 LTS (untested, checkm8 on iPhone 5 probably won't work.)  

## Vulnerabilities to use
### BootROM
- limera1n
    - BootROM exploit for run unsigned code via USB by geohot (for iPhone 4)  
- checkm8
    - BootROM exploit for run unsigned code via USB by axi0mX  (for iPhone 4s or later)  

### iBoot
- De Rebus Antiquis
    - iBoot exploit that allows arbitrary code execution on the device untether by xerub  

## Why require iOS 7 SHSH?
- This is based on xerub's De Rebus Antiquis [1]. This shows that iOS 7 iBoot can be applied to downgrade by properly exploiting it. Therefore, iOS 7 LLB and iBoot must be signed by apple.
- After triggering the exploit, the shellcode, including the untethered iBoot patch added by me [2], runs and initiates an unsigned boot.


## Nature of this iBoot exploit

### nvram
- This tool changes the nvram value and triggers an exploit. Therefore, if this tool is not properly released after use, the normal firmware will trigger a recovery mode.  

## How to cancel a trigger of exploit
### iPhone 4
- Put in device to DFU mode, cd to remove_for_i4 via terminal and execute disable  

### iPhone 4s~iPhone 5c
- Restore to iOS 9.3.5/10.3.4, and jailbreak, and execute "nvram -d boot-ramdisk" via terminal.  
//TODO, An easier way

# About Downgrade Party Blobs (for iPhone 4s or later)
**Important notes about blobs acquired at the downgrade party in January 2018**

- If you use my tool to restore with shsh2 using obtained by tsschecker, the baseband update process will be broken. These affected users are some of the users who acquired iOS 7 blobs at the downgrade party in January 2018.

### These users will need to make the following modifications when using my tool.
- backup shsh2.
- Change extension from ".shsh2" to ".plist".
- Delete all items except "APTicket" and "LLB" related.
- Change the extension back to ".shsh".

# References
[1] https://xerub.github.io/ios/iboot/2018/05/10/de-rebus-antiquis.html  
[2] https://github.com/dora2-iOS/iloader/blob/master/iPhone5,2/dora_yururi/iboot_untether.S  

# Thanks to
See README on top page
