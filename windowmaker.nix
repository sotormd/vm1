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
    wmsystemtray
    wmsm-app
    wmcube
    wmCalClock
    cputnik
    AlsaMixer-app
  ];
}
