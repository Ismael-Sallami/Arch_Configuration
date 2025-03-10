#!/bin/sh
down() {
  pamixer -d 5
  volume=$(pamixer --get-volume)
  dunstify -a "Volumen" "Bajando a $volume%" -h int:value:"$volume" -i /home/jose/.config/scripts/icons/volume.svg -r 2593 -u normal
  canberra-gtk-play -i dialog-error -d "error"
}

up() {
  pamixer -i 5
  volume=$(pamixer --get-volume)
  dunstify -a "Volumen" "Subiendo a $volume%" -h int:value:"$volume" -i /home/jose/.config/scripts/icons/volume.svg -r 2593 -u normal
  canberra-gtk-play -i dialog-error -d "error"
}

playpause() {
  playerctl play-pause
}

mute() {
  muted="$(pamixer --get-mute)"
  if $muted; then
    pamixer -u
    dunstify -a "Volumen" "UNMUTED" -i /home/ismael/.config/scripts/icons/volume.svg -r 2593 -u normal
  else
    pamixer -m
    dunstify -a "Volumen" "MUTED" -i /home/ismael/.config/scripts/icons/volume-mute.svg -r 2593 -u normal
  fi
}

case "$1" in
up) up ;;
down) down ;;
mute) mute ;;
playpause) playpause ;;
esac
