#!/bin/bash

LOGFILE="$HOME/health-monitor.log"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/health)

if [ "$STATUS" != "200" ]; then
    echo "$(date): Service unhealthy. Restarting container...">> $LOGFILE
    docker restart heal-container >> $LOGFILE
fi

MEM=$(free -m | awk '/Mem:/ {print $3}')

if [ "$MEM" -gt 400 ]; then
    echo "$(date): High memory usage: $MEM MB" >> $LOGFILE
fi
