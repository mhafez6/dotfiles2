#!/bin/bash
if [ "$SENDER" = "front_app_switched" ]; then
  sketchybar --animate tanh 10 --set "$NAME" label="$INFO"
fi
