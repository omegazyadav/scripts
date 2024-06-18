##!/bin/bash

# Get the list of sinks
sinks=$(pactl list short sinks | awk '{print $1}')

# Get the current default sink
current_sink=$(pactl list short sinks | grep -i 'RUNNING' | awk '{print $1}')

# Convert the list of sinks into an array
sink_array=($sinks)
# Find the index of the current sink in the array
current_index=-1
for i in "${!sink_array[@]}"; do
    if [[ "${sink_array[$i]}" == "$current_sink" ]]; then
        current_index=$i
        break
    fi
done

# Get the next sink in the list
next_index=$(( (current_index + 1) % ${#sink_array[@]} ))
next_sink=${sink_array[$next_index]}

# Set the next sink as the default
pactl set-default-sink $next_sink

# Move all current audio streams to the new sink
pactl list short sink-inputs | while read -r stream; do
    stream_id=$(echo $stream | awk '{print $1}')
    pactl move-sink-input $stream_id $next_sink
done
