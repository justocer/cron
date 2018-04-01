#!/bin/bash
#own justocer
if pgrep ntp; then
:
else
echo "NOTICE: ntp is not running"
systemctl start ntp || service start ntp
fi
if diff -u /etc/ntp.conf.bak /etc/ntp.conf; then
:
else
echo "NOTICE: /etc/ntp.conf was changed. Calculated diff:"
diff -u /etc/ntp.conf.bak /etc/ntp.conf | grep -e "^\-" -e "^\+"
rm /etc/ntp.conf
cp /ect/ntp.conf.bak /etc/ntp.conf
fi
if [ ! -f /etc/ntp.conf ]; then
    echo "NOTICE: /etc/ntp.conf not found!"
cp /ect/ntp.conf.bak /etc/ntp.conf
fi

 
