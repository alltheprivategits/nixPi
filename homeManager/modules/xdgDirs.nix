{ osConfig, ...  }:
{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    templates = null;
    publicShare = null;
  };
}
