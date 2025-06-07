{ pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Just the absolute essentials - most defaults are fine
      "$mod" = "SUPER";
      
      # Only bind what Hyprland doesn't have defaults for
      bind = [
        # Launch terminal - no default for this
        "$mod, Return, exec, xfce4-terminal"
        
        "$mod, C, killactive"

        # Exit Hyprland - no default for this  
        "$mod SHIFT, E, exit"
      ];

      monitor = "Virtual-1,1920x1080@60.000,0x0,1";      
    };
  };
}
