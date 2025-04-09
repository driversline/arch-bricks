#!/usr/bin/env sh

set -e

FIREFOX_URL="https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
TEMP_DIR=$(mktemp -d)

install_packages() {
    for pkg in curl tar alsa-lib gtk3; do
        if ! pacman -Qs "$pkg" > /dev/null; then
            sudo pacman -S --noconfirm "$pkg"
        fi
    done
}

download_firefox() {
    curl -L -o "$TEMP_DIR/firefox.tar.bz2" "$FIREFOX_URL"
}

extract_firefox() {
    tar -xjf "$TEMP_DIR/firefox.tar.bz2" -C "$TEMP_DIR"
}

move_firefox() {
    sudo mv "$TEMP_DIR/firefox" /opt
}

create_symlink() {
    sudo ln -sf /opt/firefox/firefox /usr/local/bin/firefox
}

cleanup() {
    rm -rf "$TEMP_DIR"
}

main() {
    install_packages
    download_firefox
    extract_firefox
    move_firefox
    create_symlink
    cleanup
}

main

exit 0
