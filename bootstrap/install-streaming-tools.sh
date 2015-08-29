#!/bin/bash
set -x -e

wget https://download.elastic.co/logstash/logstash/logstash-1.5.4.zip -O logstash.zip
wget https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz -O nodejs.tar.gz

unzip logstash.zip
tar -xf nodejs.tar.gz

sudo ln -s /home/hadoop/logstash-1.5.4/bin/logstash /usr/bin/logstash
sudo ln -s /home/hadoop/logstash-1.5.4/bin/logstash.lib.sh /usr/bin/logstash.lib.sh
sudo ln -s /home/hadoop/node-v0.12.7-linux-x64/bin/node /usr/bin/node
sudo ln -s /home/hadoop/node-v0.12.7-linux-x64/bin/npm /usr/bin/npm
