#!/bin/bash

cd ~/Library/Developer/CoreSimulator/Devices
for i in * ; do
  if [ -d "$i" ]; then
    cd "$i"
    ver=$(/usr/libexec/PlistBuddy -c "Print :runtime" "device.plist")
    name=$(/usr/libexec/PlistBuddy -c "Print :name" "device.plist")
    ext="$ver"
    touch "$name.${ext##*.}"
    cd ..
  fi
done
