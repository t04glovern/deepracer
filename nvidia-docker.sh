#!/bin/bash

pushd $(mktemp -d)
(sudo cat /etc/docker/daemon.json 2>/dev/null || echo '{}') | \
    jq '. + {"default-runtime": "nvidia"}' | \
    tee tmp.json
sudo mv tmp.json /etc/docker/daemon.json
popd
sudo systemctl restart docker