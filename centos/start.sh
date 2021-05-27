#!/bin/sh

/usr/sbin/sshd &

socat tcp-l:9999,fork,setsid,reuseaddr EXEC:/reverse.sh &

sudo -u caleb socat TCP-LISTEN:4444,reuseaddr,fork,setsid EXEC:/bin/bash
