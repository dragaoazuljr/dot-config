#!/bin/bash

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <process_name>"
    exit 1
fi

SINK_1=$(pactl list short sinks | grep -Eo '^([0-9]+)\s+alsa_output.*hdmi-stereo-extra1' | awk '{print $1}')
SINK_2=$(pactl list short sinks | grep -Eo '^([0-9]+)\s+sink-sunshine-stereo' | awk '{print $1}')

pids=$(pgrep -f "$1")

for pid in $pids; do
	inputs=$(pactl list sink-inputs | grep -B 24 "application.process.id = \"$pid\"" | grep "Sink Input #" | awk '{print substr($3, 2)}')
    for input in $inputs; do
        if [ "$(pactl list sink-inputs | grep -A 10 "Sink Input #$input$" | grep -oP 'Sink: \K[^\n]+')" == "$SINK_1" ]; then
            pactl move-sink-input "$input" "$SINK_2"
        else
            pactl move-sink-input "$input" "$SINK_1"
        fi
    done
done
