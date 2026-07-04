{
    flake.nixosModules.binary-cache-client = {
        nix.settings = {
            substituters = [
                "http://yorha:5000"
            ];
            trusted-public-keys = [
                "yorha-cache-1:cGZJhVcbNhxMs6Fvc6YPVXiMB7BuAxhoj5xGZnoQ76A="
            ];
        };
    };
}
