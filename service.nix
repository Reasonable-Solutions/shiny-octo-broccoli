{
  webserver =
    { config, pkgs, ... }:
    { deployment.targetHost = "169.254.92.92";
    };
}
