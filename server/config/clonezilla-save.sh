#!/bin/bash

ssh -t user@192.168.0.10 'sudo ocs-sr -q2 --batch -j2 -z1p -i 2000 -sc -p poweroff savedisk autoproductname sda'
