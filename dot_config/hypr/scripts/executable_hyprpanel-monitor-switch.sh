#!/bin/bash
#
# Toggle hyprpanel top bar placement. External Monitor if connected, else builtin
# src: https://gist.github.com/dr0bz/4f8bf8b8829506cf26d4e2acc770e5af
# just put the following into your hyprland.conf:
#   exec-once = hyprpanel
#   exec-once = ~/.config/hypr/scripts/hyprpanel-monitor-switch.sh

singlemonitor_keep="bar-0"
multimonitor_keep="bar-1"

# stop running it twice
scriptname=$(basename "$0")
running_count=$(ps aux | grep -i "${scriptname}" | grep -c "grep")
if [ "$running_count" -gt 2 ]; then
  echo "Exiting: Already running..."
  exit
fi

logger "${scriptname} started"

function bar_setup {
  mapfile -t bars < <(hyprpanel lw | grep "bar-")

  if [[ ${#bars[@]} -gt 1 ]]; then
    keep_bar="$multimonitor_keep"
  else
    keep_bar="$singlemonitor_keep"
  fi

  for bar in "${bars[@]}"; do
    if [[ "$bar" = "$keep_bar" ]]; then
      if [[ "$(hyprpanel iwv "$keep_bar")" = "false" ]]; then
        hyprpanel t "$keep_bar"
      fi
    else
      if [[ "$(hyprpanel iwv "$bar")" = "true" ]]; then
        hyprpanel t "$bar"
      fi
    fi
  done

}

function handle {
  case $1 in
  monitoraddedv2*)

    sleep 1
    bar_setup top_bars
    ;;
  monitorremoved*)
    mapfile -t top_bars < <(hyprpanel lw | grep "bar-")

    sleep 1
    bar_setup top_bars
    ;;
  esac
}

socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
