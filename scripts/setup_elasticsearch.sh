#!/bin/bash

sudo docker pull docker.elastic.co/elasticsearch/elasticsearch:5.4.0
sudo docker pull docker.elastic.co/kibana/kibana:5.4.0
sudo docker network create elastic --driver=bridge
sudo sysctl -w vm.max_map_count=262144
sudo docker run -p 9200:9200 -p 9300:9300 -e "bootstrap_memory_lock=true" --ulimit memlock=-1:-1 --ulimit nofile=262144:262144 --network elastic --name elasticsearch docker.elastic.co/elasticsearch/elasticsearch:5.4.0 &
sudo docker run -p 5601:5601 --network elastic docker.elastic.co/kibana/kibana:5.4.0

