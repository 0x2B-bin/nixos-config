#!/run/current-system/sw/bin/sh

wallust run $NOCTALIA_WALLPAPER_PATH;
matugen image --source-color-index 0 $NOCTALIA_WALLPAPER_PATH;
wal -i $NOCTALIA_WALLPAPER_PATH -s -t;
awww img $NOCTALIA_WALLPAPER_PATH --transition-fps 60 --transition-duration 1 --transition-type random;
