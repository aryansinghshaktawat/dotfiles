gpush() {
    git add .
    git commit -m "$1"
    git push
}


sleepoff() {
    caffeinate -dimsu &
    echo $! > ~/.caffeinate_pid
    echo "Sleep disabled"
}

sleepon() {
    if [ -f ~/.caffeinate_pid ]; then
        kill $(cat ~/.caffeinate_pid)
        rm ~/.caffeinate_pid
        echo "Sleep enabled"
    else
        echo "No active sleep blocker found"
    fi
}

neofetch

alias brewup="brew update && brew upgrade"

alias brewclean="brew cleanup"

alias screenoff 'sudo pmset -a disablesleep 1'
alias screenon 'sudo pmset -a disablesleep 0'

alias pyhs 'echo IP:  && python3 -m http.server'
