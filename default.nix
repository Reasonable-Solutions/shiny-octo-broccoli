
let defaults = { config, pkgs, name, ... }:
{
  imports = [
    ./basic-virtualbox.nix
    ./service.nix
  ];
};

in {
  network.description = "misc services";
  web = { pkgs, config, ... }: {
    imports = [ defaults ];
    deployment.targetHost = "169.254.92.92";
    networking.hostName = "cloudLike";
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
