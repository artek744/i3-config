#!/bin/bash

configPath=$(cd "$(dirname "$0")" && pwd)
sudo cp $configPath/i3blocks.conf /etc/
sudo cp $configPath/memory /usr/share/i3blocks/
sudo cp $configPath/time /usr/share/i3blocks/
sudo cp $configPath/volume /usr/share/i3blocks/

