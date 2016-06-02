#!/bin/bash

while true 
do 
    od -vAn -N400000 -tu4 < /dev/urandom > attach_1mb.tmp
    mv attach_1mb.tmp attach_1mb.rnd
    sleep 0.01

done
