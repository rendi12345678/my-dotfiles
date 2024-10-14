# Enable Powerlevel11k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export COLCON_CURRENT_PREFIX=/opt/ros/humble-base
source /opt/ros/humble-base/setup.sh
export SUDO_EDITOR="nvim"

alias "sudoedit"='function _sudoedit(){sudo -e "$1";};_sudoedit'
export MAKEFLAGS="-j$(nproc)"

edit_zsh_command() {
    temp_file=$(mktemp /tmp/zsh_command.XXXXXX)
    if [[ -n "$temp_file" ]]; then
        # Open the temporary file in Neovim for editing
        nvim "$temp_file"

        if [[ $? -eq 0 ]]; then
            # Capture the last command from the temporary file
            last_command=$(cat "$temp_file")

            # Print the last command executed
            echo -n "Last command executed: $last_command"

            # Execute the last command and capture the response
            response=$(eval "$last_command")

            # Print the response
            echo -e "\nResponse:\n$response"

            # Clean up the temporary file
            rm "$temp_file"
        else
            echo "Failed to edit the file in Neovim."
            rm "$temp_file"
        fi
    else
        echo "Failed to create a temporary file."
    fi
}

bindkey -s '^e' "edit_zsh_command^M"

autoload -Uz compinit; compinit

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/nvim/"
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias e="edit_zsh_command"
alias cd="z"
alias n="nvim"
alias sn="sudoedit"
alias c="clear"
alias t="tmux"
alias ta="tmux attach -t"
alias tn="tmux new -t"
alias tl="tmux ls"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias nq="n ~/.config/qutebrowser/config.py"
alias nn="n ~/.config/nvim"
alias nt="n ~/.tmux.conf"
alias nz="n ~/.zshrc"
alias na="n ~/.config/alacritty/alacritty.toml"
alias ni="n ~/.config/i3/config"
alias np="n ~/.config/picom/picom.conf"
alias cn="cd ~/.config/nvim"
alias ca="cd ~/.config/alacritty"
alias ci="cd ~/.config/i3"
alias cl="cd ~/learn-programming"
alias sot="tmux source ~/.tmux.conf"
alias soz="source ~/.zshrc"
alias nrw="npm run watch"
alias nrd="npm run dev"
alias nrs="npm run start"
alias nrb="npm run build"

# Git Aliases
alias ga="git add"
alias gs="git status"
alias gcm="git commit -m"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gp="git push"
alias gm="git merge"
alias gb="git branch"
alias gbd="git branch -d"
alias gr="git remote"
alias gra="git remote add"
alias grr="git remote remove"
alias grv="git remote -v"
alias gpl="git pull"
alias gl="git log --graph --oneline --decorate --all"

# Docker Aliases
alias dcu="docker compose up"
alias dcw="docker compose watch"

# Cargo Aliases
alias cw='cargo watch -q -c -w src/ -x "run -q"'

# Enable vim in zsh
bindkey -v

# Function to handle pasting
paste() {
    LBUFFER="$LBUFFER$(xclip -o -selection clipboard)"
    zle redisplay
}
zle -N paste

# Function to handle copying
copy() {
    echo -n "$BUFFER" | xclip -selection clipboard
}
zle -N copy

# Bind p to paste in vi command mode
bindkey -M vicmd 'p' paste

# Bind y to copy in vi command mode
bindkey -M vicmd 'y' copy

# Activate powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Activate ZSH syntax highlighting and zsh autosuggestions
source ~/./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.fzf/shell/key-bindings.zsh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH="/home/rendi/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/rendi/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/rendi/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/rendi/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/rendi/perl5"; export PERL_MM_OPT;
