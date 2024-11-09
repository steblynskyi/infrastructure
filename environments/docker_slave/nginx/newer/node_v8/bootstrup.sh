#!/usr/bin/env bash

#Setting docker registry from ENV variable as a short term solution --john
if [ -n $DOCKER_REGISTRY_AUTH ]; then
    mkdir -p ~/.docker
    cat >~/.docker/config.json <<EOL
    {
	"auths": ${DOCKER_REGISTRY_AUTH}
    }
EOL
fi