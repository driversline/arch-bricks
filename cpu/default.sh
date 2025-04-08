#!/usr/bin/env sh

set -e

install_packages() {
    for pkg in cpupower; do
        if ! pacman -Qs "$pkg" > /dev/null; then
            sudo pacman -S --noconfirm "$pkg"
        fi
    done
}

display_frequency_info() {
    cpupower frequency-info
}

set_frequency() {
    echo -n "Select frequency (default 2.4GHz | e.g. 2.67GHz): "
    read frequency
    frequency=${frequency:-2.4GHz}
    sudo cpupower frequency-set -f "$frequency"
}

main() {
    install_packages
    display_frequency_info
    set_frequency
}

main

exit 0
