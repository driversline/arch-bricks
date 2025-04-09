#!/usr/bin/env fish

set dns_servers "8.8.8.8" "8.8.4.4" "1.1.1.1" "1.0.0.1" "208.67.222.222" "208.67.220.220" "77.88.8.8" "77.88.8.1"

function get_user_input
    echo "Выберите основной DNS-сервер:"
    set -g PRIMARY_DNS (printf "%s\n" $dns_servers | fzf --height 10 --border)

    if test -z "$PRIMARY_DNS"
        echo "Ошибка выбора. Завершение."
        exit 1
    end
end

function apply_settings
    echo "nameserver $PRIMARY_DNS" | sudo tee /etc/resolv.conf > /dev/null
    echo "DNS-сервер $PRIMARY_DNS был успешно установлен."
end

function main
    get_user_input
    apply_settings
end

main

exit 0
