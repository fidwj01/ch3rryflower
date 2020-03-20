#!/bin/bash

if [ $# != 3 ]; then
echo "./jailbreak <iOS 6 ipsw> <iOS 7 ipsw> <out>"
exit
fi

./make_iBoot.sh $1 -iv b559a2c7dae9b95643c6610b4cf26dbd -k 3dbe8be17af793b043eed7af865f0b843936659550ad692db96865c00171959f #n90-10b329

./cherry $1 $3 -memory -derebusantiquis $2 pwniBoot jb/Cydia6.tar jb/i4untether6.tar

rm pwniBoot
