#!/bin/fish
function switch_clangd
    if test -e /usr/bin/clangd
        sudo mv /usr/bin/clangd /usr/bin/clangd-deactivated
        sudo mv /home/fred/.espressif/tools/esp-clang/bin/clangd-deactivated /home/fred/.espressif/tools/esp-clang/bin/clangd

        echo "ESP clangd"
    else
        sudo mv /usr/bin/clangd-deactivated /usr/bin/clangd
        sudo mv /home/fred/.espressif/tools/esp-clang/bin/clangd /home/fred/.espressif/tools/esp-clang/bin/clangd-deactivated
        echo "default clangd"
    end
end
