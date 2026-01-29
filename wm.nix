{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.startx = {
      enable = true;
      generateScript = false;
    };
    windowManager.openbox.enable = true;
  };

  environment.systemPackages = with pkgs; [
    azeret-mono
    obconf

    (pkgs.runCommand "my-openbox-theme" { } ''
      mkdir -p $out/share/themes
      cp -r ${./dots/theme} $out/share/themes/
    '')
  ];

  environment.etc."X11/xinit/xinitrc".source = ./dots/xinitrc;

  environment.etc."X11/app-defaults/XTerm".source = ./dots/xterm;

  programs.bash.enable = true;
  programs.bash.promptInit = builtins.readFile ./dots/prompt;
}
