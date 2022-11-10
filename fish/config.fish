if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

ufetch-arco | lolcat
bass source /home/frederico/intel/oneapi/setvars.sh >> /dev/null

alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

alias wget="wget -c"
alias grep='grep --color=auto'

alias ll='ls -all'
