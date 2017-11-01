#!/bin/bash

ssh -t user@192.168.0.10 'sudo ocs-sr -g auto -e1 auto -e2 -r -j2 -p poweroff restoredisk autoproductname sda'
