{pkgs, ...}: {
  # i3 related configs

  # TODO(lduarte): build config dynamically

  # xsession.windowManager.i3 = {
  #   enable = true;
  # };

  home.packages = with pkgs; [
      dmenu
      i3status
      i3lock
      i3blocks
      rofi
  ];
}