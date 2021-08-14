#!/bin/bash -i

# List out possible sound cards
cat /proc/asound/cards

# Read in the device number
# If you are dumb enough to mistype this you probably shouldn't use this anyway.
read -p "The device number to use:" devnum

# Write it to ALSA config file
# Printf doesn't mess up newlines
printf "defaults.pcm.card $devnum\ndefaults.ctl.card $devnum\n" > /etc/asound.conf

# Print info
echo "New settings are:"
cat /etc/asound.conf
echo "You might need to restart your programs with audio output for the changes to take place"

