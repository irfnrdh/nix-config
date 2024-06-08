
{ config, lib, pkgs, ... }:

let
  dotfilesDir = ./dotfiles;
in
{
  # Specify the state version matching the Home Manager version you're using
  home.stateVersion = "23.11";

  # Packages to install
  home.packages = with pkgs; [
    # Shell and related tools
    fish # zsh
    zoxide
    starship   # Highly customizable prompt for any shell

    # Programming
    python
    python2
    php
    apache2
    ruby
    perl

    # File managers
    nnn
    ranger
    zip
    unzip

    # Terminal workspace
    zellij
    toilet
    colorama
    jq
    figlet
    w3m
    lolcat
    pv
    neofetch
    cowsay

    # Network
    ngrok
    openssh
    ssl
    tor
    apache2

    # Pentesting tools
    nmap
    wireshark
    metasploit
    john
    aircrack-ng
    sqlmap
    hydra

    # Additional useful tools
    curl
    wget
    git
    vim

  ];

  # Shell configuration
  programs.fish = {
    enable = true;

    # Set Fish as the default shell
    defaultShell = true;

    # Configuration for Oh My Fish
    plugins = [
      {
        name = "omf";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "oh-my-fish";
          rev = "master";
          sha256 = "sha256-xxxx";  # Replace with the correct sha256 hash of the commit
        };
        postInstall = ''
          mkdir -p ${config.home.homeDirectory}/.local/share/omf
          ln -sf $out/share/omf ${config.home.homeDirectory}/.local/share/omf
        '';
      }
    ];

    # Fish configuration settings
    extraConfig = ''
      # Source OMF configuration
      if status --is-interactive
        source $OMF_CONFIG/init.fish
      end

      # Setup zoxide for Fish
      eval (zoxide init fish)

      # Setup Starship prompt
      eval (starship init fish)

      # Your custom fish functions and aliases
      alias ll='ls -alF'
      alias la='ls -A'
      alias l='ls -CF'

      alias update='nix-on-android switch .#homeConfigurations.irfnrdh.activationPackage'

      # File manager aliases
      alias fz='zellij'
      alias n='nnn'
      alias r='ranger'
    '';
  };

  # Create symbolic links for your dotfiles
  home.file.".config/fish/config.fish".source = "${dotfilesDir}/fish/config.fish";
  home.file.".config/fish/conf.d/zoxide.fish".source = "${dotfilesDir}/fish/conf.d/zoxide.fish";
  home.file.".config/fish/conf.d/omf.fish".source = "${dotfilesDir}/fish/omf.fish";
  home.file.".gitconfig".source = "${dotfilesDir}/git/gitconfig";
  home.file."~/my_custom_script.sh".source = "${dotfilesDir}/other/my_custom_script.sh";

  # Additional dotfile links can be added here

  # Zellij configuration
  home.file.".config/zellij/config.kdl".text = ''
    # Example Zellij configuration
    layout {
      default_layout = "default"
      floating_panes = true
    }

    keybindings {
      move_focus_left = ["h"]
      move_focus_right = ["l"]
      move_focus_up = ["k"]
      move_focus_down = ["j"]
    }

    themes {
      default {
        frame = "#5C6370"
        pane_titles = "#ABB2BF"
        active_tab = "#61AFEF"
      }
    }
  '';

  # Ranger configuration
  home.file.".config/ranger/rc.conf".text = ''
    # Example Ranger configuration
    set preview_images true
    set show_hidden true
    set preview_script ~/.config/ranger/scope.sh
    map f console find
    map F console find -p
    map / search_inc
  '';

  # nnn configuration
  home.file.".config/nnn/plugins/".source = "${dotfilesDir}/nnn/plugins";
  home.file.".config/nnn/plugins/fzopen".text = ''
    # Example nnn plugin configuration for fzopen
    # fzopen: open a file from the current directory using fzf
    # Make sure to have fzf installed
    fzf --height=40% --reverse | xargs -r xdg-open
  '';
}
