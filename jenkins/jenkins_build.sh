#!/bin/bash

set +ex
env

source /cvmfs/nova.opensciencegrid.org/externals/setup || exit 1
# Alternate source of products
# source /cvmfs/dune.opensciencegrid.org/products/dune/setup_dune.sh || exit 1

setup cafanacore v01.09 -q $QUALIFIER || exit 1
setup osclib v00.07 -q$QUALIFIER:stan || exit 1

setup cmake v3_14_3 || exit 1
setup ninja v1_8_2 || exit 1

make clean
time make || exit 2
