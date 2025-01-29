{pkgs, ...}: {
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

  home.packages = [
    pkgs.vscode
  ];

  programs.home-manager.enable = true;
}
