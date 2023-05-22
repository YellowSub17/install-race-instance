#!/bin/bash

if [ $(whoami) != 'ec2-user' ]
then
    echo "Error: only users with username 'ec2-user' can run this script"
    exit 1
fi

##p11data

#sudo apt install sshpass -y
#echo "Maxwellpass? " 
#read pass
#clear

maxwell='max-display3.desy.de'
desyuser='patricka'
p11datapath='/asap3/petra3/gpfs/p11/2022/data/11014376/scratch_cc/pat/crystfel_calc'


#rm -rf ~/p11data
#mkdir ~/p11data


lot1start=$(echo "16 + $2" | bc)

lot2start=$(echo "40 + $2" | bc)



for run in $(seq $lot1start 8 24);
do
    mkdir ~/p11data/$run

    printf "$(TZ='Australia/Melbourne' date +"%T")    Downloading run $run.\n"
    for i in {0..99};
    do
        printf "stream $i\r"
        sshpass -p $1 scp $desyuser@$maxwell:$p11datapath/$run/pk8_thr5_snr5/crystfel-$i.stream ~/p11data/$run/crystfel-$i.stream
    done
done

for run in $(seq $lot2start 8 60);
do
    mkdir ~/p11data/$run

    printf "$(TZ='Australia/Melbourne' date +"%T")    Downloading run $run.\n"
    for i in {0..99};
    do
        printf "stream $i\r"
        sshpass -f ~/pass scp $desyuser@$maxwell:$p11datapath/$run/pk8_thr5_snr5/crystfel-$i.stream ~/p11data/$run/crystfel-$i.stream
    done
done







