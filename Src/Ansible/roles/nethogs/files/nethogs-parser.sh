#!/bin/bash

# Command to execute
CMD="./hogs -type=csv /var/log/nethogs-server-1.log"
# Output log file
LOG_FILE="/var/log/nethogs-parser-server-1.log"

# Infinite loop
while true; do
        # Run the command, pipe the output to tee to write to the log file
        $CMD | tee "$LOG_FILE" > /dev/null
        # Wait for 1 second
        sleep 1
done