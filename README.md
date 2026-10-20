<div align="center">

<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=600&size=28&duration=3000&pause=1200&color=C9A7EB&center=true&vCenter=true&width=520&lines=Monochrome+SWAY;black+%26+white%2C+nothing+else.;a+sway+rice+in+pure+grayscale." alt="Typing SVG" /></a>

<br/>

<sub>🩶 a sway rice with zero color tolerance 🩶</sub>

</div>

---

## overview

**Monochrome-SWAY** is my personal [Sway](https://swaywm.org) rice built around one rule:
if it's not grayscale, it doesn't ship. No accent colors, no gradients pretending to be neutral —
just black, white, and everything in between.

- **Compositor:** Sway (Wayland, i3-compatible)
- **Aesthetic:** strictly monochrome — borders, bar, launcher, lockscreen, GTK apps
- **Philosophy:** minimal, readable, a little dramatic

## what's inside

| Component | Path | Notes |
| :--- | :--- | :--- |
| Sway | `.config/sway` | keybindings, window rules, gaps, grayscale borders |
| Waybar | `.config/waybar` | thin, transparent, zero chromatic nonsense |
| Rofi | `.config/rofi` | monochrome launcher |
| Swaylock | `.config/swaylock` | grayscale lockscreen |
| GTK 3 / 4 | `.config/gtk-3.0` `.config/gtk-4.0` | forces the monochrome look on GUI apps |
| Micro | `.config/micro` | editor config to match the terminal |
| Shell | `.zshrc` | prompt and aliases |
| Wallpapers | `Pictures/wallpapers` | grayscale-only selection |

## install

```bash
git clone https://github.com/sayoridev/Monochrome-SWAY.git
cd Monochrome-SWAY
cp -r .config/* ~/.config/
cp .zshrc ~/
# pick a wallpaper from Pictures/wallpapers and point your sway config at it
```

> ⚠️ **Heads up:** this overwrites your existing configs. Back up `~/.config` first.

## requirements

- [Sway](https://github.com/swaywm/sway) + [Waybar](https://github.com/Alexays/Waybar)
- [Rofi](https://github.com/davatorium/rofi) (wayland fork)
- [Swaylock](https://github.com/swaywm/swaylock)
- `zsh` for the shell config

---

<div align="center">

<sub>no colors were harmed in the making of this rice</sub>

</div>
