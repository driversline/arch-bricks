#!/usr/bin/env sh

set -e

update_grub_timeout() {
    sudo nvim +"/^GRUB_TIMEOUT=/s/GRUB_TIMEOUT=[0-9]*/GRUB_TIMEOUT=1/" +wq "/etc/default/grub"
}

generate_grub_config() {
    sudo grub-mkconfig -o /boot/grub/grub.cfg
}

main() {
    update_grub_timeout
    generate_grub_config
}

main

exit 0
