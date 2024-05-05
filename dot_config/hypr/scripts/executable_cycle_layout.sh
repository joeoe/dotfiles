#!/usr/bin/env sh

ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh

layouts=("dwindle" "master")

next_layout() {
  current=$(hyprctl getoption general:layout -j | jq -r ".str")
  for ((i = 0; i < ${#layouts[@]}; i++)); do
        if [ "${layouts[$i]}" = "$current" ]; then
            next_index=$(( (i + 1) % ${#layouts[@]} ))
            echo ${layouts[$next_index]}
        fi
    done
}

res=`next_layout`
dunstify -r 91190 -t 800 "${res}"

hyprctl keyword general:layout ${res}

