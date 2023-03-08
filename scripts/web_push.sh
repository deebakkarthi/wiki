#!/bin/sh
source ./scripts/priv.sh
hugo
rsync -r --progress -h $SRC $TARG
