#!/bin/sh
IPS=`ansible-playbook -v nodes_ip.yml |grep %% |sed 's/^.*%%\([0-9\.]\+\)%%.*$/\1/g'`
HNODES="files/nodes.http_list"
ANODES="files/nodes.ajp_list"
rm -f $NODES
for IP in $IPS; do
  if [[ $IP =~ ([0-9]+)$ ]];then
    NUM=${BASH_REMATCH[1]};
    HNODE="BalancerMember http://$IP:8080 route=$NUM"
    ANODE="BalancerMember ajp://$IP:8009  loadfactor=1 route=$NUM"
    echo $HNODE
    echo $ANODE
    echo $HNODE >> $HNODES 
    echo $ANODE >> $ANODES 
  fi
done
