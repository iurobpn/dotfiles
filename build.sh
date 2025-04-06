#!/bin/bash
image="mint:24.1"

DOCKER_BUILDKIT=1 docker build \
    -t $image \
    .

# docker run -d --name temp $image sleep infinity
#
# # Run Ansible against the container (using docker connection)
# ansible-playbook -i temp, playbook.yml -c docker
#
# # Commit changes to new image
# docker commit temp fish-image
