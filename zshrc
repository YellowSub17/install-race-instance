# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH


#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"



PROMPT='%{$fg_bold[yellow]%}%{RACEhub%}:%{$fg_bold[red]%} %3~%{$reset_color%}
%(!.#.$) '

PROMPT='$(build_prompt)'
#RPROMPT=':)'


source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
export EDITOR='vim'




#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda ...ENVS)

HYPHEN_INSENSITIVE="true"


# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"


# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"



#if conda is installed
if [ -d ~/.conda ]; then

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/home/pat/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/pat/.miniconda3/etc/profile.d/conda.sh" ]; then
# . "/home/pat/.miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
        else
# export PATH="/home/pat/.miniconda3/bin:$PATH"  # commented out by conda initialize
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<

fi



# Alias definitions.

alias cd='cd -P'
alias py='python'

alias folder='xdg-open ./ > /dev/null 2>&1' 
alias web='xdg-open "https://" > /dev/null 2>&1'

alias ipy='ipython -i'

alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin main"

alias envp='conda deactivate;conda activate phd;clear'
alias phd_pp='cd ~/Documents/phd/python_projects'



#### Functions

color_change(){
    if [[ $1 == 'BOLD' ]]; then
        echo -n "%{$fg_bold[$2]$bg[$3]%}"
    else
        echo -n "%{$fg[$2]$bg[$3]%}"
    fi
}

color_reset(){
    echo -n "%{$reset_color%}"
}

host_block(){
    echo -n " %{$USER@$HOST%}: "
}

ppath_block(){
    echo "import os\nx=list(os.getcwd().split('/'))\ny=''\nfor i in x[-3:-1]:\n\ty+=i+'/'\nprint(' '+y,end='')" | python3
}

cwd_block(){
    echo -n " %1d "
}

cmd_block(){
    echo -n "
  \u21b3 "
}

sep() {
    echo -n $'\ue0b0'
}

build_prompt(){

    color_change 'LIGHT' 'black' 'magenta'
    sep 
    color_reset

    color_change 'BOLD' 'cyan' 'magenta'
    host_block
    color_reset

    color_change 'LIGHT' 'magenta' 'white'
    sep 
    color_reset

    color_change 'LIGHT' 'blue' 'white'
    ppath_block 
    color_reset

    color_change 'LIGHT' 'white' 'white'
    sep 
    color_reset

    color_change 'BOLD' 'blue' 'white'
    cwd_block 
    color_reset

    color_change 'LIGHT' 'white' 'black'
    sep
    color_reset

    cmd_block

}




