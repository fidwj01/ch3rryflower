#!/bin/sh

function help(){
echo "[pwnA6] pwneder for A6"
echo "./pwnA6.sh device"
echo "\n[device]"
echo "\tiPhone5,1: iPhone 5  [GSM]"
echo "\tiPhone5,2: iPhone 5  [Global]"
echo "\tiPhone5,3: iPhone 5c [GSM]"
echo "\tiPhone5,4: iPhone 5c [Global]"
}

function get_url(){
if [ $1 = "iPhone5,1" ]; then
url="https://secure-appldnld.apple.com/iOS6/Restore/041-7169.20120919.5Mial/iPhone5,1_6.0_10A405_Restore.ipsw"
dname="n41ap"
iv="943ddbb6301c286875816d30f8db9c60"
key="d292297b3c1eb6b5b30e3d22e062aaa69bbf0d241aaeea226a4527ff29235b43"
fi

if [ $1 = "iPhone5,2" ]; then
url="https://secure-appldnld.apple.com/iOS6/Restore/041-7171.20120919.doJ1e/iPhone5,2_6.0_10A405_Restore.ipsw"
dname="n42ap"
iv="1e8e163389e73064096950c3e9a511af"
key="4dc9623f604ed09dd0d92eabab7f960534bf71df9d9c575a1c69a9c994b231d8"
fi

if [ $1 = "iPhone5,3" ]; then
url="https://secure-appldnld.apple.com/iOS7/091-9783.20130918.aazpo/iphone5,3_7.0_11a466_restore.ipsw"
dname="n48ap"
iv="4e897c00b40c757beaa764df7a2c29b0"
key="ce45099e76c063036d4b7fb1aa5453ea4c61f979c91ee06c98cb305e601bbadc"
fi

if [ $1 = "iPhone5,4" ]; then
url="https://secure-appldnld.apple.com/iOS7/091-9778.20130818.er45t/iphone5,4_7.0_11a466_restore.ipsw"
dname="n49ap"
iv="bf363129041e95ac7a9833c39e8ecab0"
key="b814e4a73c75530498c12179ed2756c17860759142c6f320a6e8d90f073b9421"
fi
}

if [ $# != 1 ]; then
help
fi

if [ $1 != "iPhone5,1" ] && [ $1 != "iPhone5,2" ] && [ $1 != "iPhone5,3" ] && [ $1 != "iPhone5,4" ]; then
exit
fi

./pwnedDFU -p

pwn=$(
./pwnedDFU -p | grep "device is already in pwned DFU mode. not executing exploit."
)

ibss=$(
./pwnedDFU -p | grep "make sure device is in SecureROM DFU mode and not LLB/iBSS (soft) DFU mode."
)

if [ "$pwn" != "device is already in pwned DFU mode. not executing exploit." ] && [ "$ibss" != "make sure device is in SecureROM DFU mode and not LLB/iBSS (soft) DFU mode." ]; then
echo "[ERROR] Failed enter PWND dfu mode"
exit
fi

if [ "$ibss" = "make sure device is in SecureROM DFU mode and not LLB/iBSS (soft) DFU mode." ]; then
echo "This device is already LLB/iBSS (soft) DFU mode."
exit
fi

get_url $1

../macos/bin/partialZipBrowser -g Firmware/dfu/iBSS."$dname".RELEASE.dfu $url

if [ -e "iBSS."$dname".RELEASE.dfu" ]; then
echo "file: OK"
else
echo "[ERROR] Failed firmware download"
exit
fi

../macos/bin/xpwntool iBSS* raw -iv $iv -k $key
../macos/bin/iBoot32Patcher raw softdfu --rsa

rm iBSS*
rm raw

./pwnedDFU -f softdfu

rm softdfu

sleep 0.5s

soft=$(
./pwnedDFU -p | grep "make sure device is in SecureROM DFU mode and not LLB/iBSS (soft) DFU mode."
)
if [ "$soft" = "make sure device is in SecureROM DFU mode and not LLB/iBSS (soft) DFU mode." ]; then
echo "[PWNED] Done"

echo "[PWNED] The device is already in the available pwned DFU (iBSS) mode. Current device works like kDFU mode, so you can use Odysseus or futurerestore to restore custom firmware and more."
echo "[PWNED] AES engine is enabled unlike kDFU mode. It is possible to decrypt the encrypted image."
exit
fi

echo "Failed to boot pwnediBSS"
