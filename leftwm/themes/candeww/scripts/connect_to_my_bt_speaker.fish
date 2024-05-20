#!/bin/fish

set -l speaker (bluetoothctl devices | grep 'BT-SPEAKER' | cut -d ' ' -f 2)
bluetoothctl connect $speaker
