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
    { device = "/dev/disk/by-uuid/e542c88a-2dd7-45f6-8f98-a768f4dcc4b0";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/fa3c33dc-f722-4d04-b094-260627d31b3e"; }
    ];

  nix.maxJobs = lib.mkDefault 1;
  virtualisation.virtualbox.guest.enable = true;

  environment.systemPackages = with pkgs; [ curl vim ];
  services = {
    openssh.enable = true;
    openssh.permitRootLogin = "yes";
  };
  system.stateVersion = "19.03";
}
