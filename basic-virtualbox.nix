{ config, pkgs, lib, ... }:
{
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda/";
  };

  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "ohci_pci" "ehci_pci" "sd_mod" "sr_mod" ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  nix.maxJobs = lib.mkDefault 1;
  virtualisation.virtualbox.guest.enable = true;

  environment.systemPackages = with pkgs; [ curl vim jq ];

  services = {
    openssh.enable = true;
    openssh.permitRootLogin = "yes";
  };
  system.stateVersion = "19.03";
}
