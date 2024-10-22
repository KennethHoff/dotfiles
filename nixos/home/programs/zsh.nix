{
  ...
}:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };
    initExtra = ''
      PROMPT="%F{cyan}%d%f %F{yellow}%#%f "
    '';
  };
}
