#!/usr/bin/env bash

DEVICE="*kbd*"

max=$(brightnessctl -d "$DEVICE" max 2>/dev/null || echo 1)
curr=$(brightnessctl -d "$DEVICE" g 2>/dev/null || echo 0)

if [ "$max" -gt 0 ]; then
    percent=$(( curr * 100 / max ))
else
    percent=0
fi

case "$1" in
    up)
        brightnessctl -d "$DEVICE" set +10% -q
        ;;
    down)
        brightnessctl -d "$DEVICE" set 10%- -q
        ;;
    menu)
        # Menu Rofi monocromatico per i livelli fissi
        options="0% (Off)\n25%\n50%\n75%\n100% (Max)"
        chosen=$(echo -e "$options" | rofi -dmenu -i -p "KBD LIGHT" -theme ~/.config/rofi/themes/powermenu.rasi)
        if [ -n "$chosen" ]; then
            val=$(echo "$chosen" | grep -oE '[0-9]+')
            brightnessctl -d "$DEVICE" set "${val}%" -q
        fi
        ;;
    *)
        echo "$percent"
        ;;
esac
