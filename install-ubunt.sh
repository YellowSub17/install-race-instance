



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



