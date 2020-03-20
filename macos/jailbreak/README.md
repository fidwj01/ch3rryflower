# ch3rryflower JB - v0.1 beta 1  
by @dora2_yuruyi  

# warning  
This build is beta version.  

## Supported devices  
- iPhone 4 [iPhone3,1]  

# Supported version  
- iPhone 4 [iPhone3,1]  
    - iOS 6: 6.1.3  
    
## Supported environment  
- macOS 10.13 or later  

## Vulnerabilities to use  
### BootROM  
- limera1n  
    - BootROM exploit for run unsigned code via USB by geohot (for iPhone 4)  

### iBoot  
- De Rebus Antiquis  
    - iBoot exploit that allows arbitrary code execution on the device untether by xerub  

# How to use  
- change directory to ch3rryflower/macos/jailbreak via terminal  
## 1, create CFW  
- Create CFW. 
- <iOS 7 ipsw> is required for iBoot exploits. Select the version with SHSH and the presence of De Rebus Antiquis.  
    ```
    ./jailbreak.sh <iOS 6 ipsw> <iOS 7 ipsw> <out>  
    ```

## 2, restore  
- Replace the target iOS 7 SHSH with the version you want to restore.  
- Before executing the following command, rename the iOS 7 SHSH in the shsh directory as follows  
**shsh/[ECID]-[device]-[ios-version].shsh**  
*example*  
    ```
    mv -v shsh/123456789-iPhone3,1-7.1.2.shsh shsh/123456789-iPhone3,1-6.1.3.shsh  
    ```

- Put the device in DFU mode, and enter pwned DFU mode.  
```
./pwnedDFU -p  
```

```
./idevicerestore -e -w custom.ipsw  
```

# Thanks to  
@evad3rs for jailbreak : http://evad3rs.com [source: https://github.com/OpenJailbreak/evasi0n6]  
