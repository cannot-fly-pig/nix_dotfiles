{pkgs, lib, ...}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      hlchunk-nvim
      mini-files
      mini-icons
      no-neck-pain-nvim
      onedark-nvim
      lualine-nvim
      plenary-nvim
      telescope-nvim
      vim-floaterm
      camelcasemotion
      nvim-surround
      lexima-vim
      nerdcommenter
      vim-repeat
      bufferline-nvim
    ];
  };

  home.file.".config/nvim" = {
    source = ../nvim;
    recursive = true;
  };
}
