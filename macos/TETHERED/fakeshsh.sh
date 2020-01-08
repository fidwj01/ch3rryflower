#!/bin/sh

bin/partialZipBrowser -g BuildManifest.plist https://updates.cdn-apple.com/2019/ios/091-25277-20190722-0C1B94DE-992C-11E9-A2EE-E2C9A77C2E40/iPhone_4.0_32bit_10.3.4_14G61_Restore.ipsw
zip iPhone5,2_fake.ipsw -r0 BuildManifest.plist
