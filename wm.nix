{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.startx = {
      enable = true;
      generateScript = true;
    };
    windowManager.openbox.enable = true;
  };

  environment.systemPackages = [ pkgs.urxvt ];
}
