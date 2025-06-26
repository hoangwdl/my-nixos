{ user, ... }: {
  virtualisation.docker = {
    enable = true;
  };

  virtualisation.containers = {
    enable = true;
    registries.search = [ "docker.io" "quay.io" ];
    policy = {
      default = [ { type = "insecureAcceptAnything"; } ];
      transports = {
        docker-daemon = {
          "" = [ { type = "insecureAcceptAnything"; } ];
        };
      };
    };
  };
}