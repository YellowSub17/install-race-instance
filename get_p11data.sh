#!/bin/bash

if [ $(whoami) != 'ec2-user' ]
then
    echo "Error: only users with username 'ec2-user' can run this script"
    exit 1
fi

##p11data

sudo apt install sshpass -y
echo "Maxwellpass? " 
read pass

echo "$pass" > ~/pass 
maxwell='max-display3.desy.de'
desyuser='patricka'
p11datapath='/asap3/petra3/gpfs/p11/2022/data/11014376/scratch_cc/pat/crystfel_calc'


rm -rf ~/p11data
mkdir ~/p11data

#for run in {11..24};
for run in {11..12};
do
    mkdir ~/p11data/$run
    for i in {0..99};
    do
        printf "Downloading run $run stream $i..."
        sshpass -f ~/pass scp $desyuser@$maxwell:$p11datapath/$run/pk8_thr5_snr5/crystfel-$i.stream ~/p11data/$run/crystfel-$i.stream
        printf "Done.\n"
    done
done

unset pass
rm ~/pass




