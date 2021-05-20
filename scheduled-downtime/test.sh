#!/bin/bash

set -e

mkdir -p /run/icinga2
chown icinga.icinga /run/icinga2

timedatectl set-local-rtc 0
timedatectl set-ntp 0

set -x

rm -rf /var/lib/icinga2/api/* /var/lib/icinga2/icinga2.state
timedatectl set-time "2021-03-29 08:00:00"
timeout -s INT 70 icinga2 daemon | grep Downtime

rm -rf /var/lib/icinga2/api/* /var/lib/icinga2/icinga2.state
timedatectl set-time "2021-04-01 08:15:42"
timeout -s INT 70 icinga2 daemon | grep Downtime

rm -rf /var/lib/icinga2/api/* /var/lib/icinga2/icinga2.state
timedatectl set-time "2021-05-02 09:01:00"
timeout -s INT 70 icinga2 daemon | grep Downtime

rm -rf /var/lib/icinga2/api/* /var/lib/icinga2/icinga2.state
timedatectl set-time "2021-06-05 10:01:00"
timeout -s INT 70 icinga2 daemon | grep Downtime
