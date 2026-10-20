#!/bin/bash

if command -v checkupdates >/dev/null 2>&1; then
    pacman_updates=$(checkupdates 2>/dev/null | wc -l)
else
    pacman_updates=0
fi

if command -v paru >/dev/null 2>&1; then
    paru_updates=$(paru -Qua 2>/dev/null | wc -l)
else
    paru_updates=0
fi

if command -v flatpak >/dev/null 2>&1; then
    flatpak_updates=$(flatpak remote-updates --columns=ref 2>/dev/null | wc -l)
else
    flatpak_updates=0
fi

total=$((pacman_updates + paru_updates + flatpak_updates))

if [ "$total" -gt 0 ]; then
    echo "{\"text\":\"󰮯 $total\",\"tooltip\":\"Pacman: $pacman_updates\\nParu: $paru_updates\\nFlatpak: $flatpak_updates\",\"class\":\"has-updates\"}"
else
    echo "{\"text\":\"󰮯 0\",\"tooltip\":\"System already updated\",\"class\":\"up-to-date\"}"
fi
