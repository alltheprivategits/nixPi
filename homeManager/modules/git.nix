{ osConfig, ... }:

{
  programs.git = {
    enable = osConfig.git.enable;
    lfs.enable = osConfig.git.enable;
    settings = {
      alias = {
        cl = "clean -xfd";
        pl = "log --pretty='format:%h %C(white)-%an, %C(green)%ar %C(white): %C(reset)%s'";
        co = "checkout";
        cob = "checkout -b";
        br = "branch";
        push = "push -u";
      };
      extraConfig = {
        init = {
          defaultBranch = "master";
        };
        pull = {
          rebase = true;
        };
        fetch = {
          prune = true;
        };
        core = {
          editor = "emacs";
        };
        safe = {
          directory = "/etc/nixos";
        };
      };
    };
  };
}
