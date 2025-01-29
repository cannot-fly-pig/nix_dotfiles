{
  imports = [
    ./programs/neovim.nix
    ./programs/git.nix
    ./programs/zsh.nix
  ];

  home = rec {
    username="cannotflypig";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
  programs.home-manager.enable = true;
}
