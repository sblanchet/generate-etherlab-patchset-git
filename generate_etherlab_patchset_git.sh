#!/bin/bash

# Generate a git repository from IgH EtherCAT master and uecasm
# see https://sourceforge.net/u/uecasm/etherlab-patches/ci/default/tree/

# Author: Sebastien BLANCHET
# Date: 2021-02-26

# Syntax: just run the script without arguments
# Requirements: mercurial and git

PATH=/bin:/usr/bin

DESTDIR=etherlab_patchset_`date -I`

# exit on first error
set -e

# create destination directory
mkdir -p $DESTDIR
cd $DESTDIR
# update DESTDIR with full path
DESTDIR=`pwd`

# Download repositories
hg clone -u 33b922ec1871 http://hg.code.sf.net/p/etherlabmaster/code etherlab-hg
hg clone http://hg.code.sf.net/u/uecasm/etherlab-patches etherlab-hg/.hg/patches
cd etherlab-hg
hg qpush -a

# convert to git
cd $DESTDIR

# get hg to git converter
git clone git://repo.or.cz/fast-export.git
mkdir etherlab-git
cd etherlab-git
git init
../fast-export/hg-fast-export.sh -r ../etherlab-hg
git checkout HEAD

echo "Your git repository is available in `pwd`"
