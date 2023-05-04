#!/bin/bash

if [ -f /opt/www/IDC_LH1 ]; then
    IDC_NAME=lh1
else
    IDC_NAME=dev
fi

export $(grep -v '^#' $(dirname "$0")/conf/"${IDC_NAME}"/env | xargs)
export IDC_NAME=$IDC_NAME
