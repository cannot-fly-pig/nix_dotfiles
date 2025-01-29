{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    initExtra = "source <(fzf --zsh)";
    zplug = {
      enable = true;
      plugins = [
       { name = "zsh-users/zsh-completions"; }
       { name = "zsh-users/zsh-autosuggestions"; }
       { name = "zsh-users/zsh-syntax-highlighting"; }
      ];
    };
  };

  programs.fzf = {
    enable = true;
  };
}
