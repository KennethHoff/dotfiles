# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

# Installs Home Manager v24.05
let home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];


  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.kennethhoff = {
      isNormalUser = true;
      description = "Kenneth Hoff";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    defaultUserShell = pkgs.zsh;
  };

  # Home Manager
  home-manager.users.kennethhoff = {
    home.stateVersion = "24.05";
    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
	theme = "robbyrussell";
	plugins = [ "git" ];
      };
    };
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.kitty.enable = true;
    programs.rofi.enable = true;

    wayland.windowManager.hyprland = {
     enable = true;
     settings = {
       "$mainMod" = "SUPER";
       general = {
         no_focus_fallback = true;
         gaps_in = 2;
         gaps_out = 5;
         border_size = 5;
       };
       animations = {
         enabled = true;
         animation = [
           "windows, 1, 7, default"
           "windowsOut, 1, 7, default"
           "border, 1, 10, default"
           "borderangle, 1, 8, default"
           "fade, 1, 7, default"
           "workspaces, 1, 3, default"
         ];
       };
       exec-once = [
         "firefox"
	 #"waybar"
       ];
       bind = [
         "$mainMod, Q, exec, kitty"
         "$mainMod, P, exit"
         "$mainMod, C, killactive"
         "$mainMod, R, exec, rofi -show drun"
         "$mainMod, M, fullscreen, 1"
         "$mainMod, H, movefocus, l"
         "$mainMod, J, movefocus, d"
         "$mainMod, K, movefocus, u"
         "$mainMod, L, movefocus, r"

         "$mainMod, 1, workspace, 1"
         "$mainMod, 2, workspace, 2"
         "$mainMod, 3, workspace, 3"
         "$mainMod, 4, workspace, 4"
         "$mainMod, 5, workspace, 5"
         "$mainMod, 6, workspace, 6"
         "$mainMod, 7, workspace, 7"
         "$mainMod, 8, workspace, 8"
         "$mainMod, 9, workspace, 9"
         "$mainMod, 0, workspace, 10"

         "$mainMod SHIFT, 1, movetoworkspace, 1"
         "$mainMod SHIFT, 2, movetoworkspace, 2"
         "$mainMod SHIFT, 3, movetoworkspace, 3"
         "$mainMod SHIFT, 4, movetoworkspace, 4"
         "$mainMod SHIFT, 5, movetoworkspace, 5"
         "$mainMod SHIFT, 6, movetoworkspace, 6"
         "$mainMod SHIFT, 7, movetoworkspace, 7"
         "$mainMod SHIFT, 8, movetoworkspace, 8"
         "$mainMod SHIFT, 9, movetoworkspace, 9"
         "$mainMod SHIFT, 0, movetoworkspace, 10"
       ];
      };
  };
  };


  # Enable automatic login for the user.
  services.getty.autologinUser = "kennethhoff";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    pkgs.kitty
    git
    lazygit
    gh
    firefox
    lsof
    fzf
  ];

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

