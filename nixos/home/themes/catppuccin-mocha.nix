{
  pkgs,
  ...
}:
{
  catppuccin.enable = true;

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri-dark = "file://${pkgs.nixos-artwork.wallpapers.nineish-dark-gray.src}";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # gtk = {
  #   enable = true;
  #   theme = {
  #     name = "Adwaita-dark";
  #     package = pkgs.gnome.gnome-themes-extra;
  #   };
  # };

  # qt = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };

  # gtk = {
  #   enable = true;
  #
  #   theme = {
  #     package = pkgs.flat-remix-gtk;
  #     name = "Flat-Remix-GTK-Grey-Darkest";
  #   };
  #
  #   iconTheme = {
  #     package = pkgs.gnome.adwaita-icon-theme;
  #     name = "Adwaita-dark";
  #   };
  #
  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  # };
}
