#!/bin/bash

ffmpeg -y -i "$1" -vf palettegen palette.png
ffmpeg -y -i "$1" -i palette.png -filter_complex paletteuse -r 10 "$2" && \
    rm palette.png && \
    rm "$1"
