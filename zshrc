# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH


#Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"



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




# Alias definitions.

alias cd='cd -P'
alias py='python'

alias folder='xdg-open ./ > /dev/null 2>&1' 
alias web='xdg-open "https://" > /dev/null 2>&1'

alias ipy='ipython -i'

alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin main"


