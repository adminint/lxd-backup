#!/bin/bash

LXC=`which lxc`
CUT=`which cut`
FBNAME=$(basename "$1" | $CUT -d. -f1)
RESTORE_CONTAINER_NAME=$FBNAME-restore

$LXC image import $1 --alias $RESTORE_CONTAINER_NAME
$LXC launch $RESTORE_CONTAINER_NAME $2
$LXC image delete $RESTORE_CONTAINER_NAME

