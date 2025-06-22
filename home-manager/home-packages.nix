{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #Apps
    obsidian

    #Code Editor
    vscode

    # cli tools
    btop
    cliphist
    wl-clipboard
    fzf
    zoxide
    jq
    zip
    unzip

    awscli2
    aws-sam-cli
    # aws-shell

    docker
    podman
    podman-compose

    # code languages
    go
    php
    nodejs
    python3
  ];
}
