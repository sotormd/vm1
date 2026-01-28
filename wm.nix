{ pkgs, ... }:

{
  programs.labwc.enable = true;
  environment.systemPackages = [ pkgs.alacritty ];
}
