#!/bin/bash
# This has to be synced with ssh-agent service file
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
