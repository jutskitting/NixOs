{vim_configurable, vimPlugins, ... }:

let
    customPlugins = {
    # Define custom plugins here
    };
in vim_configurable.customize {
    name = "customNvim";
    vimrcConfig.packages.myPlugins = with vimPlugins; {
        # 'start' means these plugins are started automatically
        start = [
            # nerdtree
            vim-addon-nix
            awesome-vim-colorschemes
            # Add other plugins here
        ] ++ (builtins.attrValues customPlugins);
    };

    vimrcConfig.customRC = ''
        syntax enable
        colorscheme 256_noir
        filetype on
        set mouse=v
        set scrolloff=20
        set number
        set cursorline
        set clipboard+=unnamedplus
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        set expandtab
        set wrap
        set backspace=indent,eol,start
        set history=1000
        set noswapfile
    '';
        # add other vim settings here
}

