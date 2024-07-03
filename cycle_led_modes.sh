#!/bin/bash

modes=("static" "breathe" "pulse")
current_mode=$(asusctl led-mode -g | grep -oP '(?<=Current mode: )\w+')

for i in "${!modes[@]}"; do
    if [[ "${modes[$i]}" == "$current_mode" ]]; then
        next_mode=${modes[((i + 1) % ${#modes[@]})]}
        asusctl led-mode $next_mode
        break
    fi
done
