
#!/bin/fish
function switch_gcc
    sudo mv /usr/bin/cc-other /usr/bin/cc-temp
    sudo mv /usr/bin/c++-other /usr/bin/c++-temp

    sudo mv /usr/bin/cc /usr/bin/cc-other
    sudo mv /usr/bin/c++ /usr/bin/c++-other

    sudo mv /usr/bin/cc-temp /usr/bin/cc
    sudo mv /usr/bin/c++-temp /usr/bin/c++
end
