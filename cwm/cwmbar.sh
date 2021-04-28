#!/bin/bash
# To use with lemonbar
# not 100% POSIX -- "echo -n" used

. ~/.cache/wal/colors.sh

# hexcodes -> lemonbar color format
fgd="%{F${foreground}}"
bgd="%{B${background}}"
accent="%{F${color1}}"
overline="%{U${color1}}"

separator="${accent}->${fgd}"
separator2="${accent}|${fgd}"
colon="${accent}:${fgd}"
percent="${accent}% ${fgd}"
missing="${accent}~${fgd}"
muted="[${accent}m${fgd}] "
full="[${accent}f${fgd}] "

battery() {
  b="$(cat /sys/class/power_supply/BAT0/capacity)"
  if [ "$b" -eq "100" ]; then
    echo -n "$full"
  else
    echo -n "${b}${percent}"
  fi
}

clock() {
  date "+%H${colon}%M"
}

volume() {
  if [ -z "$(amixer sget Master | grep off)" ]; then
    amixer sget Master | grep -o "[0-9]*%" | head -1 | sed 's/%/'"${percent}"'/'
  else
    echo -n "$muted"
  fi
}


{
  xprop -spy -root _NET_CURRENT_DESKTOP &
  while true; do
    echo 0
    sleep 1
  done
} | while read -r; do
  current=$(( $(xprop -root _NET_CURRENT_DESKTOP | cut -d' ' -f3) ))
  workspaces=$(seq -s' ' $(( $(xprop -root _NET_NUMBER_OF_DESKTOPS | cut -d' ' -f3) - 1)) |
                 sed 's/'${current}'/%{+o}'${current}'%{-o}/g')
  echo "${overline}${bgd} ${fgd}\
        %{l}  $(clock)\
        %{c}  $workspaces\
        %{r} $(battery)$(volume) "
done
