#! /usr/bin/env nix-shell
#! nix-shell -i bash -p dropbear

mkdir -p /home/gitpod/.ssh
if test -z "$SSH_KEY"; then
  echo "Warning: SSH_KEY not set, skipping SSH setup"
else
  echo "$SSH_KEY" >> /home/gitpod/.ssh/authorized_keys

[ -f /workspace/dropbear.hostkey ] || dropbearkey -t rsa -f /workspace/dropbear.hostkey
dropbear -r /workspace/dropbear.hostkey -F -E -s -p 2222 -P ~/dropbear.pid
