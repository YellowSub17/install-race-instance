


git clone https://github.com/YellowSub17/install-race-instance.git

if [ $(whoami) != 'ec2-user' ]
then
    echo "Error: only users name 'ec2-user' can run this script"
    exit 1
fi


sudo apt update
sudo apt upgrade



##VIM
cp ~/install-race-instance/vimrc ~/.vimrc
vim
sudo apt install cmake -y
python3 ~/.vim/plugged/YouCompleteMe/install.py


##ZSH
sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ~/install-race-instance/zshrc ~/.zshrc
echo 'PROMPT="%{$fg_bold[yellow]%}%{RACEhub%}:%{$fg_bold[red]%} %3~%{$reset_color%}
%(!.#.$) "' >> ~/.zshrc
source ~/.zshrc



##CRYSTFEL

git clone https://gitlab.desy.de/thomas.white/crystf://gitlab.desy.de/thomas.white/crystfel
sudo apt install -y build-essential libhdf5-dev libgsl-dev \
                 libgtk-3-dev libcairo2-dev libpango1.0-dev \
                 libgdk-pixbuf2.0-dev libfftw3-dev \
                 git flex bison libzmq3-dev libmsgpack-dev \
                 libeigen3-dev libccp4-dev \
                 ninja-build python3
https://github.com/mesonbuild/meson/releases/download/1.0.2/meson-1.0.2.tar.gz
tar -xzf ~/meson-1.0.2.tar.gz
cd ~/crystfel
~/meson-1.0.2/meson.py build
ninja -C build
sudo ldconfig
rm -rf ~/meson-1.0.2*


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

for i in {11..24};
do
    mkdir ~/p11data/$i
    sshpass -f ~/pass scp $desyuser@$maxwell:$p11datapath/$i/pk8_thr5_snr5/stderr-64.log ~/p11data/$i/stderr-64.log
done
rm ~/pass



#####Junk

#echo "####"
#echo "####Installing ZSH"
#echo "####"
#sleep 2
#sudo apt install util-linux-user -y
#sudo apt install zsh -y 
#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


#echo "####"
#echo "####Copying RC files"
#echo "####"
#sleep 2
#rm ~/.zshrc
#rm ~/.vimrc



#echo "####"
#echo "####Github Auth"
#echo "####"
#sleep 2
#git config --global init.defaultBranch main
#git config --global user.name "YellowSub17"
#git config --global user.email "patrick_aust@hotmail.com"
#git config --global credential.helper store



##type -p apt-config-manager >/dev/null || sudo apt install apt-utils
##sudo apt-config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
#sudo apt install gh -y
#gh auth login
#echo "####"
#echo "####Install Anaconda"
#echo "####"
#sleep 2
##sudo yum install libXcomposite libXcursor libXi libXtst libXrandr alsa-lib mesa-libEGL libXdamage mesa-libGL libXScrnSaver
#wget https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh
#bash Anaconda3-2023.03-1-Linux-x86_64.sh
#source ~/anaconda3/bin/activate
#conda init
#rm Anaconda3-2023.03-1-Linux-x86_64.sh




#echo "####"
#echo "####Install Crystfel"
#echo "####"
#sleep 2
#git clone https://gitlab.desy.de/thomas.white/crystfel.git


