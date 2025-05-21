#!/usr/bin/env bash

lockfile="/tmp/battlestation.lock"

if [ -f "$lockfile" ]; then
  hyprpanel toggleWindow bar-0
  hyprpanel toggleWindow bar-1
  rm "$lockfile"
else
  hyprpanel toggleWindow bar-0
  touch "$lockfile"
fi
