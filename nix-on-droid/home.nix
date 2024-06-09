{ config, lib, pkgs, ... }:

let
  dotfilesDir = ./dotfiles;
in
{
  # Specify the state version matching the Home Manager version you're using
  home.stateVersion = "23.11";

  nixpkgs.config.allowUnfree = true;

  # Packages to install
  home.packages = with pkgs; [
    # Shell and related tools
    
    neovim
    nano


    nix-info

    fish # zsh
    zoxide
    starship   # Highly customizable prompt for any shell

    # Programming
    python3
    # python2
    php
    ruby
    perl
    gawk

    # File managers
    nnn
    ranger
    zip
    unzip

    # Terminal workspace
    zellij
    toilet
    python311Packages.colorama
    jq
    figlet
    w3m
    lolcat
    pv
    neofetch
    cowsay
    eza
    bat
    which
    fzf

    # Network
    ngrok
    openssh
    sslh
    tor
    nginx

    # Pentesting tools
    nmap
    wireshark
    metasploit
    john
    aircrack-ng
    sqlmap
    # hydra

    # Additional useful tools
    curl
    wget
    git
    vim
    

  ];

  # programs.fish = {
  #   enable = true;
  #   defaultShell = true;

  #   plugins = [
  #     {
  #       name = "omf";
  #       src = pkgs.fetchFromGitHub {
  #         owner = "oh-my-fish";
  #         repo = "oh-my-fish";
  #         rev = "master";
  #         sha256 = "sha256-actualsha256here";  # Replace with the correct sha256 hash
  #       };
  #       postInstall = ''
  #         mkdir -p ${config.home.homeDirectory}/.local/share/omf
  #         ln -sf $out/share/omf ${config.home.homeDirectory}/.local/share/omf
  #       '';
  #     }
  #   ];

  #   extraConfig = ''
  #     if status --is-interactive
  #       source $OMF_CONFIG/init.fish
  #     end
  #     eval (zoxide init fish)
  #     eval (starship init fish)
  #     alias ll='ls -alF'
  #     alias la='ls -A'
  #     alias l='ls -CF'
  #     alias update='nix-on-android switch .#homeConfigurations.irfnrdh.activationPackage'
  #     alias fz='zellij'
  #     alias n='nnn'
  #     alias r='ranger'
  #   '';
  # };

  # home.file.".config/fish/config.fish".source = "${dotfilesDir}/fish/config.fish";
  # home.file.".config/fish/conf.d/zoxide.fish".source = "${dotfilesDir}/fish/conf.d/zoxide.fish";
  # home.file.".config/fish/conf.d/omf.fish".source = "${dotfilesDir}/fish/omf.fish";
  # home.file.".gitconfig".source = "${dotfilesDir}/git/gitconfig";
  # home.file."~/my_custom_script.sh".source = "${dotfilesDir}/other/my_custom_script.sh";

  # home.file.".config/zellij/config.kdl".text = ''
  #   layout {
  #     default_layout = "default"
  #     floating_panes = true
  #   }
  #   keybindings {
  #     move_focus_left = ["h"]
  #     move_focus_right = ["l"]
  #     move_focus_up = ["k"]
  #     move_focus_down = ["j"]
  #   }
  #   themes {
  #     default {
  #       frame = "#5C6370"
  #       pane_titles = "#ABB2BF"
  #       active_tab = "#61AFEF"
  #     }
  #   }
  # '';

  # home.file.".config/ranger/rc.conf".text = ''
  #   set preview_images true
  #   set show_hidden true
  #   set preview_script ~/.config/ranger/scope.sh
  #   map f console find
  #   map F console find -p
  #   map / search_inc
  # '';

  # home.file.".config/nnn/plugins/".source = "${dotfilesDir}/nnn/plugins";
  # home.file.".config/nnn/plugins/fzopen".text = ''
  #   fzf --height=40% --reverse | xargs -r xdg-open
  # '';
}

