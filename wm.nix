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
      mkdir -p $out/share/themes/vm1
      cp -r ${./dots/theme}/* $out/share/themes/vm1/
    '';
  };

  tint2-bin = pkgs.writeShellScriptBin "tint2" ''
    ${pkgs.tint2}/bin/tint2 --config ${./dots/tint2}
  '';

  tint2-wrapper = pkgs.symlinkJoin {
    name = "tint2";
    paths = [ pkgs.tint2 ];
    postBuild = ''
      rm $out/bin/tint2
      cp ${tint2-bin}/bin/tint2 $out/bin/tint2
    '';
  };
in
{
  services.xserver = {
    enable = true;
    displayManager.startx = {
      enable = true;
      generateScript = false;
    };
  };

  environment.systemPackages = with pkgs; [
    openbox-wrapper
    tint2-wrapper
    w3m
  ];

  fonts.packages = [ pkgs.jetbrains-mono ];

  environment.etc."X11/xinit/xinitrc".source = ./dots/xinitrc;

  environment.etc."X11/app-defaults/XTerm".source = ./dots/xterm;

  programs.bash.enable = true;
  programs.bash.promptInit = builtins.readFile ./dots/prompt;
}
