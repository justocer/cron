#!/bin/bash
#own justocer
apt-get update -qq >/dev/null && apt-get install -y ntp -qq >/dev/null
#substitute ntp server
sed -i -e 's/0.ubuntu.pool.ntp.org/ua.pool.ntp.org/g' /etc/ntp.conf
#delete another servers
sed -i -e 's/pool 1.ubuntu.pool.ntp.org iburst/#/g' /etc/ntp.conf
sed -i -e 's/pool 2.ubuntu.pool.ntp.org iburst/#/g' /etc/ntp.conf
sed -i -e 's/pool 3.ubuntu.pool.ntp.org iburst/#/g' /etc/ntp.conf
sed -i -e 's/pool ntp.ubuntu.com/#/g' /etc/ntp.conf
systemctl restart ntp || service restart ntp
bat=$(find / -name ntp_verify.sh)
{ crontab -l 2>/dev/null; echo "*/5 * * * * $bat"; } | crontab
cp /etc/ntp.conf /etc/ntp.conf.bak
