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

  environment.systemPackages = [ pkgs.azeret-mono ];

  environment.etc."X11/xinit/xinitrc".source = ./dots/xinitrc;

  environment.etc."X11/app-defaults/XTerm".source = ./dots/xterm;

  programs.bash.enable = true;
  programs.bash.promptInit = builtins.readFile ./dots/prompt;
}
