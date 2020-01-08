#!/bin/bash

device=$(unzip -l $1 | grep Firmware/dfu/iBSS. | cut -d '.' -f 2)

if [ $# != 5 ]; then
echo "./make_iBoot.sh <ipsw(target)> -iv [iBoot-iv] -k [iBoot-key]"
exit
fi

if [ $2 != "-iv" ]||[ $4 != "-k" ]; then
echo "bad args"
exit
fi


mkdir iboottmp/
cd iboottmp/

unzip -j ../$1 Firmware/all_flash/all_flash.$device.production/iBoot*
mv -v iBoot* tmp
../bin/xpwntool tmp ibot.dec -iv $3 -k $5
../bin/iBoot32Patcher ibot.dec ibot.pwned --rsa --debug -b "-v" --boot-partition --boot-ramdisk
../bin/xpwntool ibot.pwned iBoot -t tmp
echo "0000010: 6365" | xxd -r - iBoot
echo "0000020: 6365" | xxd -r - iBoot
mv -v iBoot ..
cd ..
rm -r iboottmp
