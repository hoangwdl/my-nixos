# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, stateVersion, hostname, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos/modules
    ];

  networking.hostName = "nixosvm"; # Define your hostname.

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    # vscode
    vim
    wget
    spice-vdagent
    home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "yes";
    };
  };
  services.spice-vdagentd.enable = true;

  system.stateVersion = stateVersion;

  # For QEMU VMs - ensure proper graphics support
  hardware.graphics.enable = true;
  
  # If you're using virtio-gpu
  # services.xserver.videoDrivers = [ "virtio" ];
  
  # Or if you're using different graphics in QEMU
  services.xserver.videoDrivers = [ "qxl" ];
  
  # Enable Wayland support
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";  # Often needed in VMs
  };
}
