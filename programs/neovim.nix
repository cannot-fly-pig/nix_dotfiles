{pkgs, lib, inputs, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  home.file.".config/nvim" = {
    source = ../nvim;
    recursive = true;
  };
}
