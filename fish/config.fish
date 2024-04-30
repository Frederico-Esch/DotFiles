if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""

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

set -gx ODIN_ROOT "/usr/lib/odin/"
set -x DEBUGINFOD_URLS "https://debuginfod.archlinux.org"
set -x ROSWELL_INSTALL_DIR "/home/fred/.roswell"
