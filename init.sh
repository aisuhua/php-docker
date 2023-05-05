#!/bin/bash

if [ -f /opt/www/IDC_LH1 ]; then
    export IDC_NAME=lh1
    export USERID=1000
    export GID=0
else
    export IDC_NAME=dev
    export USERID=1000
    export GID=0
fi
