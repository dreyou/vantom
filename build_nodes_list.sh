#!/bin/sh
IPS=`ansible-playbook -v nodes_ip.yml |grep %% |sed 's/^.*%%\([0-9\.]\+\)%%.*$/\1/g'`
NODES="files/nodes.list"
rm -f $NODES
for IP in $IPS; do
  if [[ $IP =~ ([0-9]+)$ ]];then
    NUM=${BASH_REMATCH[1]};
    NODE="BalancerMember http://$IP:8080 route=$NUM"
    echo $NODE
    echo $NODE >> $NODES 
  fi
done
