#!/bin/bash

LOGFILE="/var/log/syslog"
grep -i "error" "$LOGFILE" | tail -n 20
