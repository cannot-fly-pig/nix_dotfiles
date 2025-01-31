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

  home.packages = with pkgs; [
    ripgrep
    pkgs.gcc12
    unzip
    deno
  ];

  programs.home-manager.enable = true;
  programs.ripgrep.enable = true;
}
