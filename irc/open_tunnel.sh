#!/bin/bash
# Replace xxxx and xx.xx.xx.xx with your VPS  username and ip address respectively. 

ssh -L localhost:6697:irc.freenode.net:6697 xxxx@xx.xx.xx.xx -N -v &
echo $! > ~/tunnel.pid
