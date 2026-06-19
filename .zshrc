export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
export PATH="/Applications/AeroSpace.app/Contents/MacOS:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/Users/yusse/Downloads/zine:$PATH"

fpath+=($(brew --prefix)/share/zsh/site-functions)
ZSH_THEME="half-life"

export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

alias zshconfig="mate ~/.zshrc"
alias vi='nvim'
alias chnvim='nvim ~/.config/nvim/init.lua'
alias chaero='nvim ~/.config/aerospace/aerospace.toml'
alias chghost='nvim ~/.config/ghostty/config'
alias chzsh='nvim ~/.zshrc'
alias gtc='cd ~/Coding/'
alias gtp='cd ~/Coding/projects/'
alias lc='ls -GFlash --color'
alias zb='zig build'

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)


__conda_setup="$('/Users/yusse/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/yusse/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/yusse/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/yusse/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# opencode
export PATH=/Users/yusse/.opencode/bin:$PATH
