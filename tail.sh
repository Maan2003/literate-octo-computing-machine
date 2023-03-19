#! /usr/bin/env nix-shell
#! nix-shell -i bash -p tailscale

tailscaled &
tailscale up --hostname "gitpod-${GITPOD_WORKSPACE_ID}" \
    --authkey "${TAILSCALE_AUTHKEY}"
