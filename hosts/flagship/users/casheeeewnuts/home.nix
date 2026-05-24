{ config, pkgs, modules, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "casheeeewnuts";
  home.homeDirectory = "/home/casheeeewnuts";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  # imports = [ modules.nixvim modules.dms modules.dms-niri modules.niri-flake ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    # firefox
    # git
    # cloudflared
    # foot
    # tmux
    #nerd-fonts.jetbrains-mono
    #nerd-fonts.noto
    #nerd-fonts.dejavu-sans-mono
    #noto-fonts-cjk-sans
    #noto-fonts-color-emoji
    #noto-fonts
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  
  xdg.configFile = {
    #"niri" = {
    #  source = ./niri;
    #  recursive = true;
    #};
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/casheeeewnuts/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {};

  # programs.neovim = {
  #   enable = true;
  #   waylandSupport = true;
  #   plugins = with pkgs.vimPlugins; [
  #     # { plugin = lualine-nvim;   type = "lua"; config = ''require("lualine").setup()''; }
  #     # { plugin = nvim-autopairs; type = "lua"; config = ''require("nvim-autopairs").setup()''; }
  #     # { 
  #     #   plugin = telescope-nvim;
  #     #   type = "lua";
  #     #   config = nvimPlugins.config.telescope;
  #     # }
  #     # { plugin = plenary-nvim; }
  #     # { plugin = nvim-treesitter.withAllGrammars; type = "lua"; config = ''
  #     #   vim.api.nvim_create_autocmd('FileType', {
  #     #     pattern = { '<filetype>' },
  #     #     callback = function() vim.treesitter.start() end,
  #     #   })
  #     # '';}

  #     # { plugin = nvim-treesitter-textobjects; type = "lua"; config = ''require("nvim-treesitter-textobjects")''; }
  #     # { plugin = nvim-tree-lua; type = "lua"; config = ''require("nvim-tree").setup()''; }
  #     # { plugin = nvim-web-devicons; }
  #     # { plugin = catppuccin-nvim; type = "lua"; config = ''require("catppuccin").setup()''; }
  #   ];

  #   initLua = ''
  #   vim.opt.number   = true
  #   vim.o.expandtab  = true
  #   vim.o.shiftwidth = 2
  #   vim.o.tabstop    = 2

  #   vim.cmd.colorscheme "catppuccin"
  #   '';

  #   extraPackages = [
  #     pkgs.python3
  #     pkgs.lua51Packages.lua
  #     pkgs.lua51Packages.luarocks
  #     pkgs.ripgrep
  #     pkgs.fd
  #     tree-sitter
  #   ];
  # };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "casheeeewnuts";
  	      email = "shu.nonaka@casheeeewnuts.net";
      };
  
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
  
      alias = {
        cm = "commit";
        sw = "switch";
        s  = "status";
      };
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono NF:size=10";
        term = "xterm-256color";
      };
      colors = {
        alpha = 0.75;
      };
    };
  
    server.enable = true;
  };
  
  programs.bash = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  #programs.carapace.enable = true;
  programs.atuin.enable = true;
  programs.zellij = {
    enable = true;
    attachExistingSession = true;
    enableBashIntegration = true;
  };
  programs.tealdeer.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
