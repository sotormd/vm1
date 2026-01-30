{ pkgs, ... }:

let
  openbox-bin = pkgs.writeShellScriptBin "openbox" ''
    ${pkgs.openbox}/bin/openbox --config-file ${./dots/openbox}
  '';

  openbox-wrapper = pkgs.symlinkJoin {
    name = "openbox";
    paths = [ pkgs.openbox ];
    postBuild = ''
      rm $out/bin/openbox
      cp ${openbox-bin}/bin/openbox $out/bin/openbox
      mkdir -p $out/share/themes/coffee
      cp -r ${./dots/theme}/* $out/share/themes/coffee/
    '';
  };
in
{
  services.xserver = {
    enable = true;
    displayManager = {
      startx = {
        enable = true;
        generateScript = false;
      };
    };
    windowManager.session = [
      {
        name = "openbox";
        start = "${openbox-wrapper}/bin/openbox-session";
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    openbox-wrapper
    brightnessctl
  ];

  fonts.packages = [ pkgs.jetbrains-mono ];

  environment.etc."X11/xinit/xinitrc".source = ./dots/xinitrc;

  environment.etc."X11/app-defaults/XTerm".source = ./dots/xterm;

  programs.bash.enable = true;
  programs.bash.promptInit = builtins.readFile ./dots/prompt;
}
