{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Just the absolute essentials - most defaults are fine
      "$mod" = "SUPER";

      # Startup applications
      exec-once = [
        "waybar"
      ];      

      # Only bind what Hyprland doesn't have defaults for
      bind = [
        # Launch terminal - no default for this
        "$mod, Return, exec, kitty"
        
        "$mod, C, killactive"

        # Exit Hyprland - no default for this  
        "$mod SHIFT, E, exit"
      ];

      # monitor = "Virtual-1,1920x1080@60.000,0x0,1";      
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
