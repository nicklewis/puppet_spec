#!/bin/bash

set -e
set -u

. local_setup.sh

if getent group bozo; then
  groupdel bozo
fi

$BIN/puppet resource group bozo ensure=present gid=12768
getent group bozo | grep 12768
