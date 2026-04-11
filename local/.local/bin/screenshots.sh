#!/bin/bash

SAVE_DIR="$HOME/Pictures"
mkdir -p "$SAVE_DIR"

# 选择截图类型
TYPE=$(echo -e "Fullscreen Screenshot\nArea Screenshot" | dmenu -l 2 -p "Choose screenshot type")
[ -z "$TYPE" ] && exit 1

# 选择保存方式
SAVE_MODE=$(echo -e "Save to File\nSave to Clipboard\nSave to Both\nPin at Screen" | dmenu -l 4 -p "Choose save mode")
[ -z "$SAVE_MODE" ] && exit 1

FILE="$SAVE_DIR/screenshot_$(date +%Y%m%d_%H%M%S).png"

# 根据截图类型生成截图数据
if [ "$TYPE" = "Fullscreen Screenshot" ]; then
    CMD="maim"
elif [ "$TYPE" = "Area Screenshot" ]; then
    CMD="maim -s"
else
    exit 1
fi

# 根据保存模式执行
case "$SAVE_MODE" in

    "Save to File")
        $CMD "$FILE"
        notify-send "Screenshot saved to file" "$FILE"
        ;;

    "Save to Clipboard")
        $CMD | xclip -selection clipboard -t image/png
        notify-send "Screenshot copied to clipboard"
        ;;

    "Save to Both")
        $CMD | tee "$FILE" | xclip -selection clipboard -t image/png
        notify-send "Saved + Copied" "$FILE"
        ;;

    "Pin at Screen")
        TMPFILE=$(mktemp /tmp/screenshot-pin-XXXXXX.png)
        $CMD "$TMPFILE"
        feh --title "pin-screenshot" "$TMPFILE" &
        ;;

    *)
        exit 1
        ;;
esac
