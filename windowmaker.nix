{
  services.xserver = {
    enable = true;
    displayManager.startx = {
      enable = true;
      generateScript = true;
    };
    windowManager.windowmaker.enable = true;
  };
}
