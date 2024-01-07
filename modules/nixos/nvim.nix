{ pkgs, ... }:
{
  packageOverrides = pkgs: with pkgs; {
    myVim = vim_configurable.customize {
      name = "vim-with-plugins";
      # add here code from the example section
    };
    myNeovim = neovim.override {
      configure = {
        customRC = ''
          # here your custom configuration goes!
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent  
set number
        '';
        packages.myVimPackage = with pkgs.vimPlugins; {
          # see examples below how to use custom packages
          start = [ ];
          opt = [ ];
        }; 
      };     
    };
  };
}
