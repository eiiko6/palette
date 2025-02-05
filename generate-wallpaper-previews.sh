#!/bin/bash

CACHE_DIR="$HOME/.cache/palette/wallpapers/"
MASK_PATH="$CACHE_DIR/../mask.png"
PROCESSED_LIST="$CACHE_DIR/../processed_files.txt"
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Ensure the cache directory exists
mkdir -p "$CACHE_DIR"

# Create mask if it doesn't exist
if [[ ! -f "$MASK_PATH" ]]; then
  magick -size 500x500 xc:none -draw "roundrectangle 0,0,500,500,32,32" "$MASK_PATH" 2>/dev/null
fi

# Ensure processed files list exists
touch "$PROCESSED_LIST"

# Process new wallpapers
find "$WALLPAPER_DIR" -type f | while read -r wallpaper; do
  relative_path="${wallpaper#"$WALLPAPER_DIR"/}" # Get relative path
  relative_path_png="${relative_path%.*}.png"    # Change extension to .png
  output_file="$CACHE_DIR/$relative_path_png"
  output_dir=$(dirname "$output_file")

  # Ensure the corresponding directory exists in the cache
  mkdir -p "$output_dir"

  # Check if the wallpaper has already been processed
  if ! grep -Fxq "$relative_path_png" "$PROCESSED_LIST"; then
    # Process wallpaper and convert to PNG
    magick "$wallpaper" -resize 500x500^ -gravity center -extent 500x500 -alpha set "$MASK_PATH" -compose DstIn -composite "$output_file" 2>/dev/null

    # Mark as processed
    echo "$relative_path_png" >>"$PROCESSED_LIST"
  fi

done
