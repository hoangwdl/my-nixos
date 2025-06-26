# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../nixos/modules
    ];

  networking.hostName = "nixos";

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  # hardware.bluetooth.settings.General.ControllerMode = "bredr";

  # Enable Bluetooth GUI management
  services.blueman.enable = true;  # This provides the Bluetooth manager GUI

  # Ensure the firmware is available
  hardware.enableRedistributableFirmware = true;

  # Add the specific firmware package for MT7922
  hardware.firmware = with pkgs; [
    linux-firmware
  ];

  # hardware.bluetooth.package = pkgs.bluez;

  # hardware.bluetooth = {
  #   enable = true;
  #   powerOnBoot = true;
  #   # package = pkgs.bluez;
  #   settings = {
  #     General = {
  #       ControllerMode = "dual";
  #     };
  #     Policy = {
  #       AutoEnable = "true";
  #     };
  #   };
  # };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hoang = {
    isNormalUser = true;
    description = "Hoang Nguyen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    home-manager
  ];

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

  system.stateVersion = "25.05";

}
