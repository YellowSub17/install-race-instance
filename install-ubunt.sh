
if [ $(whoami) != 'ec2-user' ]
then
    echo "Error: only users name 'ec2-user' can run this script"
    exit 1
fi


sudo apt update -y
sudo apt upgrade -y



cp ~/install-race-instance/vimrc .vimrc
vim


sudo apt install cmake
python3 ~/.vim/plugged/YouCompleteMe/install.py



sudo apt install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



cp ~/install-race-instance/zshrc .zshrc


echo 'PROMPT="%{$fg_bold[yellow]%}%{RACEhub%}:%{$fg_bold[red]%} %3~%{$reset_color%}
%(!.#.$) "' >> .zshrc




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


