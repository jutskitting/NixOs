{vim_configurable, vimPlugins, ... }:

let
    customPlugins = {
    # Define custom plugins here
    };
in vim_configurable.customize {
    vimrcConfig.packages.myPlugins = with vimPlugins; {
        # 'start' means these plugins are started automatically
        start = [
            # nerdtree
            # vim-addon-nix
            awesome-vim-colorschemes
            # Add other plugins here
        ] ++ (builtins.attrValues customPlugins);
    };

        # add other vim settings here
}

