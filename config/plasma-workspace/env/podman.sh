#!/bin/bash
# Use user's podman as Docker replacement
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
