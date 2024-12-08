#!/usr/bin/env bash
#
# NOTE(lduarte): heavily inspired from: https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5 (from this video https://www.youtube.com/watch?v=CwfKlX3rA6E)

# A rebuild script that commits on a successful build
set -e

# cd to your config dir (this expects for this folder to be always at your home)
pushd ~/nix-config

# Early return if no changes were detected (thanks @singiamtel!)
if git diff --quiet; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi



# Shows your changes
git diff -U0 '*.nix'

echo "NixOS Rebuilding..."

# add files, because we need flakes only import versioned files
git add -A

# Rebuild, output simplified errors, log trackebacks
sudo nixos-rebuild switch &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

# Get current generation metadata
current=$(nixos-rebuild list-generations | grep current)
generation_number=$(echo $current | awk '{print $1}')

# Commit all changes with the generation metadata as a message
# Use metadata as a possible description
git commit --edit -m "TODO" -m "Generation metadata: $current"

# push to origin, if possible
git push

# Back to where you were
popd
