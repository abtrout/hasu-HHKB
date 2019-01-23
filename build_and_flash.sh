#!/usr/bin/env bash

TARGET=atmega32u4
KEYMAPFILE=hhkb.hex

# On some machines, I need to `sudo dfu-programmer`.
sudo -v

make clean && make

echo "=================================="
echo "Ready to flash. Please put keyboard in bootloader mode"
echo "Sleeping for 15 seconds..."
echo "=================================="

sleep 15

if [[ $? -eq 0 ]]; then
  sudo -- sh -c "
    dfu-programmer $TARGET erase && \
    dfu-programmer $TARGET flash $KEYMAPFILE && \
    dfu-programmer $TARGET reset"
fi
