
#sudo apt install feh
#sudo apt install xdg-utils
sudo apt install lib32z1
sudo apt install libc6-i386
sudo apt install lsb
sudo apt install libx11-dev
sudo apt-get install libx11-dev xserver-xorg-dev xorg-dev
### install dep
#gnuplot


sudo apt install gnuplot -y



#ccp4

wget 'https://www.ccp4.ac.uk/download/download_file.php?os=linux&pkg=ccp4-64&sid=58149b9ce847f96e8a2659cc426cee2173e3b9f1'

mv download_file.php* ccp4.tar.gz
tar -xzf ccp4.tar.gz


#fit2d
wget http://ftp.esrf.eu/pub/expg/FIT2D/fit2d_10.132_i686_linuxV2.2.10



mv fit2d* fit2d

###install

mkdir mlfsom
cd mlfsom
wget https://bl831.als.lbl.gov/~jamesh/mlfsom/development_snapshot.tar.gz
tar -xzf development_snapshot.tar.gz
rm development_snapshot.tar.gz












