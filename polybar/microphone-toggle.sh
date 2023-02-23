#! /usr/bin/env bash

RED='%{F#F00}'
GREEN='%{F#0F0}'
NOCOLOR='%{F-}'
FONT='%{T3}'
NOFONT='%{T-}'

if pactl get-source-mute 1 | grep -q 'yes'; then
  echo "${FONT}${RED}${NOCOLOR}${NOFONT}" # Muted Icon (Install Some icon pack like feather, nerd-fonts)
else
  echo "${FONT}${GREEN}${NOCOLOR}${NOFONT}" # Unmuted Icon (Install Some icon pack like feather, nerd-fonts)
fi
