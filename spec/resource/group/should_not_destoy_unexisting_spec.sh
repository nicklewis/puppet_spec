#!/bin/bash

set -e
set -u

. local_setup.sh

if getent group bozo; then
  groupdel bozo
fi

! $BIN/puppet resource group bozo ensure=absent | grep 'notice: /Group[bozo]/ensure: removed'
