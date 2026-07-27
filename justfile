# nh os switch .
switch:
    nh os switch .

# nix flake update <input>
upp input="":
    nix flake update {{input}}

# nix flake up
up: 
    nix flake update

# Remote build for any host
rbuild host:
    nh os switch .#{{host}} --target-host {{host}}

# Local build for any host
lbuild host:
    nh os switch .#{{host}} --target-host {{host}} --build-host {{host}}
