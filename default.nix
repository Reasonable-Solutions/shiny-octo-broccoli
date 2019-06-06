{
  network.enableRollback = true;
  network.description = "misc services";

  defaults ={
    imports = [
      ./basic-virtualbox.nix
    ];
  };

  web = { pkgs, config, ... }: {
    deployment.targetHost = "169.254.92.92";
    networking.hostName = "cloudLike";
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}
