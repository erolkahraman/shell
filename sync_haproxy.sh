#!/bin/bash

# Sync haproxy.cfg file changes to other haproxy nodes.
# Erol Kahraman
# 20211001 v1
# 20211008 v2

RS=/usr/bin/rsync
FL=/etc/haproxy/haproxy.cfg
SRVS=( "192.168.100.112" "192.168.100.113")
SSH=/usr/bin/ssh
SYSCTL=/usr/bin/systemctl

for ha_server in ${SRVS[@]}
do
  is_change=$(${RS} -a --out-format='%n' --dry-run $FL root@${ha_server}:/etc/haproxy/haproxy.cfg)
  if [ ${is_change} ]; then
    $RS -az --progress $FL root@$ha_server:/etc/haproxy/haproxy.cfg
    logger "${is_change} file is updated."
    logger "HAPROXY on ${ha_server} is restarting..."
    $SSH root@$ha_server "systemctl restart haproxy.service"
    if [ "$($SSH root@$ha_server "systemctl is-active haproxy.service")" = "active" ]; then
      logger "HAPROXY on ${ha_server} is restarted successfully."
    else
      logger "HAPROXY on ${ha_server} failed."
    fi
  fi
done
