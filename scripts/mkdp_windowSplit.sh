#!/bin/bash

# 检查当前终端是否处于全屏模式
is_fullscreen=$(xdotool getactivewindow getwindowgeometry | grep -c "Geometry: 1920x1080")

if [ "$is_fullscreen" -eq 1 ]; then
  # 退出全屏模式
  xdotool getactivewindow windowunmap
  sleep 1
  xdotool getactivewindow windowmap
fi

# 打开Firefox并将其放置在屏幕右侧
firefox &
sleep 5
firefox_window=$(xdotool search --onlyvisible --class firefox | head -n 1)
echo "Firefox window ID: $firefox_window"
xdotool windowmove $firefox_window 960 0
xdotool windowsize $firefox_window 960 1080

# 调整终端大小并将其放置在屏幕左侧
terminal_window=$(xdotool getactivewindow)
echo "Terminal window ID: $terminal_window"
xdotool windowsize $terminal_window 960 1080
xdotool windowmove $terminal_window 0 0
