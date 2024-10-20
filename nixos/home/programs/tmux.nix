{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    escapeTime = 0;
  };
}
