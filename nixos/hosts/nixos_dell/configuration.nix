{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos_dell"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Cannot be used in conjunction with wireless (apparently..)

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # TODO: Is this needed?
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

  # Enable automatic login for the user.
  services.getty.autologinUser = "kennethhoff";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim
    kitty
    git
    lazygit
    gh
    firefox
    lsof
    fzf
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    jetbrains-mono
  ];

  programs = {
    hyprland = {
      enable = true;
    };
    zsh.enable = true;
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

