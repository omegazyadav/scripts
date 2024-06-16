#!/bin/bash

# Step 1: List the available sinks and find the one for the system speaker
speaker_sink=$(pactl list short sinks | grep -i 'alsa_output' | awk '{print $2}')

# Step 2: Set the default sink to the system speaker sink
if [ -n "$speaker_sink" ]; then
  pactl set-default-sink "$speaker_sink"
  echo "Default sink set to $speaker_sink"

  # Step 3: Move any currently playing audio streams to the new default sink
  for stream in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$stream" "$speaker_sink"
  done
  echo "Moved all audio streams to $speaker_sink"
else
  echo "No system speaker sink found"
fi

