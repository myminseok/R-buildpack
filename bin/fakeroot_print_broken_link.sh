#!/bin/bash
for l in $(find / -type l | grep -v /proc | grep -v /var/log | grep -v /tmp); do cd $(dirname $l); if [ ! -e "$(readlink $(basename $l))" ]; then ls -al $l; fi; cd - > /dev/null; done



