{
  pkgs,
  ...
}:
{
  imports = [
    ./common.nix
    ../../programs/obs-studio.nix
  ];
  home.packages = with pkgs; [
    slack
    vesktop # Custom Discord App with Improved Desktop (and `Vencord` pre-installed, which - among other things - adds support for plugins)
  ];
}
