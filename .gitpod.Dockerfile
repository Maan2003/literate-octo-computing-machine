FROM gitpod/workspace-base

USER root

RUN curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix \
  | sh -s -- install linux --extra-conf "sandbox = false" --init none --no-confirm
