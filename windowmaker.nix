{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.startx = {
      enable = true;
      generateScript = true;
    };
    windowManager.windowmaker.enable = true;
  };

  environment.systemPackages = with pkgs.dockapps; [
    cputnik
  ];

  environment.etc."X11/app-defaults/XTerm".text = ''
    XTerm*termName: xterm-256color
    XTerm*utf8: 2
    XTerm*locale: true

    XTerm*background: #282828
    XTerm*foreground: #ebdbb2
    XTerm*cursorColor: #ebdbb2

    XTerm*selectForeground: #282828
    XTerm*selectBackground: #ebdbb2

    XTerm*saveLines: 10000
    XTerm*scrollBar: false

    XTerm*colorMode: true
    XTerm*dynamicColors: true

    XTerm*color0:  #282828  ! black
    XTerm*color1:  #cc241d  ! red
    XTerm*color2:  #98971a  ! green
    XTerm*color3:  #d79921  ! yellow
    XTerm*color4:  #458588  ! blue
    XTerm*color5:  #b16286  ! magenta
    XTerm*color6:  #689d6a  ! cyan
    XTerm*color7:  #a89984  ! white

    XTerm*color8:  #928374  ! bright black
    XTerm*color9:  #fb4934  ! bright red
    XTerm*color10: #b8bb26  ! bright green
    XTerm*color11: #fabd2f  ! bright yellow
    XTerm*color12: #83a598  ! bright blue
    XTerm*color13: #d3869b  ! bright magenta
    XTerm*color14: #8ec07c  ! bright cyan
    XTerm*color15: #ebdbb2  ! bright white
  '';
}
