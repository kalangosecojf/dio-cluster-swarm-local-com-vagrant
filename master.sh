#!/bin/bash
sudo docker swarm init --advertise-addr=192.198.2.210
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh