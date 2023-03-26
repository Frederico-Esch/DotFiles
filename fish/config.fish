if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

set -l val (random 0 1)

if [ $val -eq 0 ]
    ufetch-arco | lolcat
else
    colorscript random
end

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

alias esp_export='. /home/frederico/Downloads/esp-idf/export.fish'

fish_add_path ~/Downloads/Odin/
fish_add_path ~/.local/bin/
fish_add_path ~/.cargo/bin/
fish_add_path ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin/
setxkbmap -option compose:menu
#fish_add_path ~/Downloads/ols/

