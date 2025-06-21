{
  programs.git = {
    enable = true;
    userName = "Hoang Nguyen";
    userEmail = "nbhoangit@gmail.com";
  };

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github-personal" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_personal";
      };
      "github-work" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}