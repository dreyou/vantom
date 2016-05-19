#!/bin/sh
IPS=`ansible-playbook -v nodes_ip.yml |grep %% |sed 's/^.*%%\([0-9\.]\+\)%%.*$/\1/g'`
HNODES="files/nodes.http_list"
ANODES="files/nodes.ajp_list"
HTML=html/index.html
HTML_HOSTS=html/js/hosts.js
JHT="//##Auto generated host list\nvar j4p = [];\n//###"
rm -f $HNODES
rm -f $ANODES
IPSL=0
for IP in $IPS; do
  if [[ $IP =~ ([0-9]+)$ ]];then
    NUM=${BASH_REMATCH[1]};
    HNODE="BalancerMember http://$IP:8080 route=$NUM"
    ANODE="BalancerMember ajp://$IP:8009  loadfactor=1 route=$NUM"
    echo $HNODE
    echo $ANODE
    echo $HNODE >> $HNODES 
    echo $ANODE >> $ANODES 
    IPSL=$((IPSL+1))
  fi
done
for NUM in $(seq 1 $IPSL);do
    JHT="$JHT\nj4p[$NUM] = new Jolokia(\"http://localhost:808$NUM/jolokia\");"
done
JHT="$JHT\n//###\n"
echo -e $JHT
echo -e $JHT > $HTML_HOSTS
exit 0
