{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    vscode

    # cli tools
    btop
    cliphist
    wl-clipboard
    fzf
    zip
    unzip

    # coding
    php
    nodejs
    python3
  ];
}
