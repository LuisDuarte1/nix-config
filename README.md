# Luís Duarte's Nix config

This is the repo that I use to manage all my machines config - you can think of it as a supercharged `.dotfiles` repo but with reproducibility in mind (and allowing to set system packages/configs too!).

Feel free to take any config or to use this a starter :)

My personal machine, `lduarte-laptop`, uses NixOS (so using Nix for everything is easy), but the `home` configs should work for pretty much every distro.

## Adding/reinstalling a machine that uses NixOS

Flake only imports files that have been added into a git repo so, you'll have to override/add the `hardware-configuration.nix` file for each machine - you can get this by using `nixos-generate-config` and copying it over to `./nixos/hardware-configuration/<hostname>.nix`. Then you can use anywhere you want (probably the in `flake.nix` file)