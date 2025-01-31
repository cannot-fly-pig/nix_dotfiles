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
      denops-vim
      ddc-vim
      ddc-ui-native
      ddc-source-around
      ddc-filter-matcher_head
      ddc-filter-sorter_rank
    ];
  };

  home.file.".config/nvim" = {
    source = ../nvim;
    recursive = true;
  };
}
