#!/bin/sh

# Start the SSH server
/usr/sbin/sshd &

# Ensure we are in a writeable directory
cd /tmp

# Start a service which can trigger reverse shells
socat tcp-l:9999,fork,setsid,reuseaddr EXEC:/reverse.sh &

# Start an infinite bind shell
sudo -u caleb socat TCP-LISTEN:4444,reuseaddr,fork,setsid EXEC:/bin/bash
