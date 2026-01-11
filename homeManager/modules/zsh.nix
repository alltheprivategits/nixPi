{ osConfig, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = osConfig.zsh.enable;
    shellAliases = {
      g = "git";
      G = "git";
      reboot = "sudo reboot";
      poweroff = "sudo poweroff";
      switch = "nh os switch";
      search = "nh search";
      boot = "nh os boot";
      test = "nh os test";
      update = "nh os switch -a --update";
      clean = "nh clean all";
      collect = "nix-collect-garbage";
      blog = "cd ~/git/blog && nix develop --command zsh";
      logout = "hyprctl dispatch exit";
    };
    profileExtra = ''
    # inhibit loading zsh if ssh connection comes from tramp
    if [ $TERM = dumb ]; then
       unset RPROMPT
       unset RPS1
       unset zle_bracketed_paste
       PS1="$ "
       unsetopt zle
       unsetopt rcs  # Inhibit loading of further config files
    fi
    '';
    initContent = ''
    key[Control-Left]="''${terminfo[kLFT5]}"
    key[Control-Right]="''${terminfo[kRIT5]}"
    [[ -n "''${key[Control-Left]}"  ]] && bindkey -- "''${key[Control-Left]}"  backward-word
    [[ -n "''${key[Control-Right]}" ]] && bindkey -- "''${key[Control-Right]}" forward-word
    '';
    enableCompletion = true;
    # loginExtra = "/nix/store/$(ls -la /nix/store | grep polkit-kde-agent | grep '^d' | awk '{print $9}')/libexec/polkit-kde-authentication-agent-1";
    defaultKeymap = "emacs";
  };
}
