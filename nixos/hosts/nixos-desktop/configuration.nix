# Description:
# This is the firmware configuration for the Dell Laptop (Previously known as "Work Laptop")
{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];
  nix = {
    package = pkgs.nixVersions.git;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos-desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Cannot be used in conjunction with wireless (apparently..)

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # TODO: Is this needed?
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "";
  };

  services.upower.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.kennethhoff = {
      isNormalUser = true;
      description = "Kenneth Hoff";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      password = "1234";
    };
    defaultUserShell = pkgs.zsh;
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "kennethhoff";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      kitty
      git
      lazygit
      gh
      firefox
      lsof
      fzf
      wl-clipboard
      wayvnc # Remote Desktop Application (Wayland Virtual Network Computing)
    ];
  };
  fonts.packages = with pkgs; [
    noto-fonts
    jetbrains-mono
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    waybar.enable = true;
    nix-ld.enable = true;

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
      gamescopeSession.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
    };
  };

  security.pam.services.hyprlock = { };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
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
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22 # SSH
  ];
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
