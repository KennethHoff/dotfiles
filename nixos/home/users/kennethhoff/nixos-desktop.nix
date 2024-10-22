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

  systemd.user.services.wayvnc = {
    Unit.Description = "Allows remote connections to this host";
    Install.WantedBy = [ "default.target" ];
    Service = {
      ExecStart = "${pkgs.wayvnc}/bin/wayvnc -o DP-1 0.0.0.0 5900";
      Restart = "always";
      RestartSec = 10;
    };
  };
}
