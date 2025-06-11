{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Just the absolute essentials - most defaults are fine
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
    #   "$fileManager" = "$terminal -e sh -c 'ranger'";
    #   "$menu" = "wofi";

      # Startup applications
      exec-once = [
        "waybar"
      ];  

      monitor = "Virtual-1,1920x1080@60.000,0x0,1";      
    };
  };

  # Additional Wayland applications
  home.packages = with pkgs; [
    kitty        # Terminal
    #wofi         # Application launcher
    # waybar       # Status bar
    #hyprpaper    # Wallpaper
    #grim         # Screenshot tool
    #slurp        # Screen area selection
    #wl-clipboard # Clipboard utilities
    #thunar       # File manager
  ];
}
