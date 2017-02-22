#!/bin/bash

set -xe

#  this is an experiment in using concourse CI for building K2
cd k2

#  generate a config file
./up.sh --generate

#  set a cluster name
conf=~/.kraken/config.yaml
sed -ie 's/cluster:/cluster: concourse/g' $conf

#  generate some keys
keypath=~/.ssh/id_rsa
ssh-keygen -t rsa -N "" -f $keypath

#  GOGO GADGET
./up.sh

#  DOWN DOWN GADGET
./down.sh