#!/bin/bash
if [ -e $PWD/tunnel.pid ] 
then
        kill `cat $PWD/tunnel.pid`
	rm $PWD/tunnel.pid
fi

