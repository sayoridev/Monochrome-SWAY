#!/usr/bin/env bash

# Opzioni del menu con icone Nerd Font
op_lock="  Block Screen"
op_logout="󰍃  Logout"
op_suspend="󰤄  Sleep"
op_reboot="󰑐  Reboot"
op_shutdown="󰐥  Power off"

# Formatta le opzioni per Rofi
options="$op_lock\n$op_logout\n$op_suspend\n$op_reboot\n$op_shutdown"

# Esegui Rofi caricando il tema dedicato
chosen=$(echo -e "$options" | rofi -dmenu \
    -i \
    -p "SYSTEM" \
    -theme ~/.config/rofi/themes/powermenu.rasi)

# Gestione della scelta
case "$chosen" in
    "$op_lock")
        swaylock-effects || swaylock
        ;;
    "$op_logout")
        swaymsg exit
        ;;
    "$op_suspend")
        systemctl suspend
        ;;
    "$op_reboot")
        systemctl reboot
        ;;
    "$op_shutdown")
        systemctl poweroff
        ;;
esac
