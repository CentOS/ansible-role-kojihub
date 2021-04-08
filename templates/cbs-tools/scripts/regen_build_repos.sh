#!/bin/bash

#
# CBS external repo check
# Called by : cron, managed by: Ansible
# purposes: Download repodata for external repositories and submit koji regen-repo
#

PATH=$PATH:/usr/local/bin:/sbin:/usr/sbin/

log_file="/var/tmp/cbs-mirror-check.log"
declare -A releases
releases=( 
["8"]="http://mirror.centos.org/centos/8/COMPOSE_ID"
["8s"]="http://mirror.centos.org/centos/8-stream/COMPOSE_ID"
["7"]="http://mirror.centos.org/centos/7/updates/x86_64/repodata/repomd.xml"
)


function f_log() {
        echo "[*] $(date +%Y%m%d-%H:%M) : -> $*" >> $log_file
}

function f_errorcheck() {
 if [ "$?" = "0" ]; then
   f_log "$* : PASS => continuing ..."
 else
   f_log "$* : FAIL => exiting ..."
   exit 1
 fi
}

f_log "[STARTING] Verifying external mirrors"
for release in "${!releases[@]}" ; do
  test -e /var/tmp/mirror-${release}.checksum || touch /var/tmp/mirror-${release}.checksum
  current_checksum=$(curl --silent "${releases[$release]}"|sha256sum|awk '{print $1}')
  cbs_checksum=$(cat /var/tmp/mirror-${release}.checksum)
  f_log "Mirror checksum for CentOS ${release} is ${current_checksum}"
  f_log "Local CBS cached checksum is ${cbs_checksum}"
  if [ "${current_checksum}" == "${cbs_checksum}" ] ; then
    f_log "CBS repo is current so no need to trigger regen-repo"
  else
    f_log "CBS cached repodata seems old so triggering regen-repo"
    echo "${current_checksum}" > /var/tmp/mirror-${release}.checksum
    for buildroot in $(koji list-tags|grep el${release}-build) ; do
      f_log "koji regen-repo --nowait ${buildroot}"
      koji regen-repo --nowait ${buildroot} >> $log_file 2>&1
    done
  fi
done
f_log "[END] Finished processing koji externalrepos check"
