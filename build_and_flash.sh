#!/usr/bin/env bash

TARGET=atmega32u4
KEYMAPFILE=hhkb.hex

make clean && make

if [[ $? -eq 0 ]]; then
  dfu-programmer $TARGET erase
  dfu-programmer $TARGET flash $KEYMAPFILE
  dfu-programmer $TARGET reset
fi
