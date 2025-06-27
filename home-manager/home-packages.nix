{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  # nixpkgs.config.packageOverrides = pkgs: {
  #   tableplus = pkgs.writeShellScriptBin "tableplus" ''
  #     exec ${pkgs.appimage-run}/bin/appimage-run ${./tableplus.AppImage} "$@"
  #   '';
  # };

  home.packages = with pkgs; [

    appimage-run

    #browsers
    google-chrome
    brave

    #Apps
    obsidian
    slack

    #Code Editor
    vscode

    postman
    bruno
    bruno-cli
    dbeaver-bin
    # tableplus

    # cli tools
    gnumake
    stow
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

    qemu
    virt-manager
  ];
}
