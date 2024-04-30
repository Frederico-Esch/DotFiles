#!/bin/fish
function swank
    ros -e '(ql:quickload :swank) (swank:create-server)' &> /dev/null wait exit &
end
