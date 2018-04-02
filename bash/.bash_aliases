function list_shortcuts {
        bind -P | grep 'can be' | sed -e 's/can be found on/=/' -e 's/\.$//'
        stty -a | awk 'BEGIN{RS="[;\n]+ ?"}; /= ..$/'
}
alias mtab="cat /etc/mtab | column -t"
#alias myip="curl ifconfig.me"
alias myip="curl ipinfo.io/ip"
#alias history="history | colorize.py 4"
