#!/bin/bash

# Ruta donde se guardará la captura
CAPTURE_PATH="$HOME/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png"

# Crear el directorio si no existe
mkdir -p "$(dirname "$CAPTURE_PATH")"

# Capturar la región seleccionada y guardarla en el archivo
grim -g "$(slurp)" "$CAPTURE_PATH"

# Copiar la imagen al portapapeles
wl-copy <"$CAPTURE_PATH"

# Notificación
notify-send "Captura de pantalla" "Captura guardada en $CAPTURE_PATH y copiada al portapapeles"
