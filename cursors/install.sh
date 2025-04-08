#!/usr/bin/env sh

set -e

sudo pacman -S --noconfirm gtk2 gtk3

mkdir -p ~/.local/share/icons
mkdir -p ~/.config/gtk-3.0

tar xvf $HOME/ВАШ-ПУТЬ-ДО-АРХИВА-КУРСОРА.tar.gz -C ~/.local/share/icons
sudo tar xvf $HOME/ВАШ-ПУТЬ-ДО-АРХИВА-КУРСОРА.tar.gz -C /usr/share/icons

touch ~/.config/gtk-3.0/settings.ini
touch ~/.gtkrc-2.0

echo -e '[Icon Theme]\nInherits=НАЗВАНИЕ-ТЕМЫ-КУРСОРА' | sudo tee /usr/share/icons/default/index.theme
echo -e '[Settings]\ngtk-cursor-theme-name=НАЗВАНИЕ-ТЕМЫ-КУРСОРА' >> ~/.config/gtk-3.0/settings.ini
echo 'gtk-cursor-theme-name="НАЗВАНИЕ-ТЕМЫ-КУРСОРА"' >> ~/.gtkrc-2.0

exit 0
