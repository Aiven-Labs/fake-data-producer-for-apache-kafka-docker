#!/usr/bin/env bash

# Get repository
git clone https://github.com/aiven/python-fake-data-producer-for-apache-kafka.git
pip install -r python-fake-data-producer-for-apache-kafka/requirements.txt
pip install aiven-client
