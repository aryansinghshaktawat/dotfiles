# -----------------------------
# Terminal Startup
# -----------------------------

clear
neofetch


# -----------------------------
# Git Functions
# -----------------------------

gpush() {
    git add .
    git commit -m "$1"
    git push
}


# -----------------------------
# Display Sleep Control
# -----------------------------

sleepoff() {
    caffeinate -dimu &
    echo $! > ~/.display_sleep_pid
    echo "Display sleep disabled"
}

sleepon() {
    if [ -f ~/.display_sleep_pid ]; then
        kill "$(cat ~/.display_sleep_pid)" 2>/dev/null
        rm ~/.display_sleep_pid
        echo "Display sleep enabled"
    else
        echo "No active display sleep blocker found"
    fi
}


# -----------------------------
# Lid Closure Display Control
# -----------------------------

screenoff() {
    sudo pmset -a disablesleep 1
    echo "Mac will stay awake even when lid is closed"
}

screenon() {
    sudo pmset -a disablesleep 0
    echo "Normal lid sleep behavior restored"
}


# -----------------------------
# Homebrew Aliases
# -----------------------------

alias brewup='brew update && brew upgrade'
alias brewclean='brew cleanup'


# -----------------------------
# Python HTTP Server
# -----------------------------

pyhs() {
    echo "IP Address:"
    ipconfig getifaddr en0
    python3 -m http.server
}


# -----------------------------
# Useful Aliases
# -----------------------------

alias c='clear'
alias ll='ls -lah'
alias la='ls -A'
alias reload='source ~/.zshrc'
alias zshconfig='nano ~/.zshrc'
alias finder='open .'

# ------------------------------
# update dot files and push
# ------------------------------


updatedot() {
    cp ~/.zshrc ~/Desktop/dotfiles/
    cp ~/.gitconfig ~/Desktop/dotfiles/
    
    cd ~/Desktop/dotfiles || return

    git add .
    git commit -m "$1"
    git push
}


