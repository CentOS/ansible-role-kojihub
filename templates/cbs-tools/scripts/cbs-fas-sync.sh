#!/bin/bash

#
# Script: cbs-fas-sync
# Purpose: fetching users/groups from FAS and sync permissions within Koji
# Called by: Cron job
# Configured by: Ansible
#

PATH=$PATH:/usr/local/bin:/sbin:/usr/sbin/:/usr/bin/

{% if koji_fas_sync %}
fas_fetch_script="/opt/cbs-tools/scripts/koji-group-sync.py"
{% elif koji_fasjson_sync %}
fas_fetch_script="/opt/cbs-tools/scripts/fasjson-group-sync"
{% endif %}
koji_config_script="/opt/cbs-tools/scripts/fas_perms_to_koji.py"
logfile="/var/tmp/cbs-fas.log"
groups_to_exclude="hpv"

function exit_check() {
  if [ "$?" -ne "0" ] ; then
    zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -k koji.fas_sync -o 1
    echo "[+] $(date): Error detected , please check manually the output" >>$logfile
    echo "[+] $(date): Exiting ...." >> $logfile
    exit 1
  else
    zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -k koji.fas_sync -o 0
  fi 
}

echo "[+] $(date): Fetching users/groups from FAS ..." >> $logfile
$fas_fetch_script 2>&1 >> $logfile
exit_check

echo "[+] $(date): Excluding blacklisted groups from fetched list ..." >> $logfile
for group in $groups_to_exclude;
do
  sed -i "/$group/d" /etc/bsadmin/groups 2>&1 >> $logfile
done
exit_check


echo "[+] $(date): Synchronizing in Koji ..." >> $logfile
$koji_config_script 2>&1 >> $logfile
exit_check

echo "[+] $(date): Sync finished and settings applied when needed" >> $logfile
echo "[+] $(date): ---------------------------------------------" >> $logfile
echo " " >> $logfile

