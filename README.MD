# Wallpaper Manager

This project provides a simple way to manage and change wallpapers in wayland using a combination of Bash scripts. It includes wallpaper preview icons generation, a wallpaper changer, and even a selection menu.

## Dependencies

Ensure you have the following dependencies installed:
- `swww` (for setting the wallpaper)
- `wofi` (for the wallpaper selection menu)
- `wal` (for generating color schemes)
- `ImageMagick` (for processing wallpaper previews)
- `waybar` (optional, restarted for color scheme updates)

## Usage

### Generate Wallpaper Previews
Before using the wallpaper changer, generate previews of wallpapers from `~/Pictures/Wallpapers/` and its subdirectories by running:
```bash
./generate-wallpaper-previews.sh
```

This script will create nicely cropped versions of your wallpapers in `~/.cache/palette/wallpapers/`.
I recommend running it at boot. For Hyprland: `exec-once = ~/.config/scripts/palette/generate-wallpaper-previews.sh` fox example.
It might take time the first time if you have a lot of wallpapers.

### Change Wallpaper via CLI
To manually change the wallpaper, use:
```bash
./change-wallpaper.sh -p /path/to/wallpaper.png
```
Alternatively, if the wallpaper is located in `~/Pictures/Wallpapers/`, you can use:
```bash
./change-wallpaper.sh wallpaper_name
```

### Select Wallpaper via Wofi Menu
To open the wallpaper selection menu with a search bar, run:
```bash
./change-wallpaper-menu.sh
```
This will display a list of available wallpapers with thumbnails for easy selection.

## Notes
- Wallpapers should be stored in `~/Pictures/Wallpapers/` or its subdirectories.
- Previews are stored in `~/.cache/palette/wallpapers/`.
- The wallpaper changer script updates the system's color scheme using `wal` and sets the wallpaper using `swww`.

---
Enjoy your dynamic wallpaper setup! 🎨
