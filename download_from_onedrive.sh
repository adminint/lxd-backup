#!/bin/bash

WGET=`which wget`
echo "$1&download=1"
$WGET -cO - "$1&download=1" > $2.tar.gz
