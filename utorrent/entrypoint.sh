#!/bin/bash

trap 'killall -TERM utserver' term
ln -s ~/bin/webui.zip ~/data/
~/bin/utserver -settingspath ~/data/ "$@" &
wait
