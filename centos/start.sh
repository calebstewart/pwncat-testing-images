#!/bin/sh

/usr/sbin/sshd &

sudo -u caleb socat TCP-LISTEN:4444,reuseaddr,fork,setsid EXEC:/bin/bash
