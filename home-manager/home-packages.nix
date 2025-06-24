{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    #browsers
    google-chrome

    #Apps
    obsidian
    slack

    #Code Editor
    vscode

    postman
    bruno
    bruno-cli
    dbeaver-bin

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
    yarn
    pnpm
    python3
    uv
  ];
}
