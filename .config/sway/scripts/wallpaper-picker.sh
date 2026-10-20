#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CACHE_DIR="$HOME/.cache/rofi-wallpapers"
THUMB_SIZE="400x300"

mkdir -p "$CACHE_DIR"
if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Wallpaper Error" "Directory $WALLPAPER_DIR not found!"
    exit 1
fi

find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.webp" \) | sort | while read -r img; do
    name=$(basename "$img")
    thumbname="${name%.*}.png"
    thumbpath="$CACHE_DIR/$thumbname"

    if [ ! -f "$thumbpath" ] || [ "$img" -nt "$thumbpath" ]; then
        magick "$img" -strip -resize "$THUMB_SIZE^" -gravity center -extent "$THUMB_SIZE" "$thumbpath" 2>/dev/null
    fi

    if [ -f "$thumbpath" ]; then
        printf "%s\0icon\x1f%s\n" "$name" "$thumbpath"
    else
        printf "%s\n" "$name"
    fi
done | rofi -dmenu -theme ~/.config/rofi/themes/wallpaper.rasi -p "Wallpaper" | while read -r selected_name; do
    if [ -n "$selected_name" ]; then
        pkill swaybg
        orig_img=$(find "$WALLPAPER_DIR" -type f -name "$selected_name" | head -n 1)
        swaybg -i "$orig_img" -m fill &
        echo "$orig_img" > ~/.config/sway/current_wallpaper
        if grep -q "^image=" ~/.config/swaylock/config 2>/dev/null; then
            sed -i "s|^image=.*|image=$orig_img|" ~/.config/swaylock/config
        else
            echo "image=$orig_img" >> ~/.config/swaylock/config
        fi
    fi
done
