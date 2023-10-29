{ config, lib, pkgs, ... }:

let
  buildTheme = { name, version, src, themeIni ? [] }:
    pkgs.stdenv.mkDerivation rec {
      pname = "sddm-theme-${name}";
      inherit version src;

      buildCommand = ''
        dir=$out/share/sddm/themes/${name}
        doc=$out/share/doc/${pname}

        mkdir -p $dir $doc
        if [ -d $src/${name} ]; then
          srcDir=$src/${name}
        else
          srcDir=$src
        fi
        cp -r $srcDir/* $dir/
        for f in $dir/{AUTHORS,COPYING,LICENSE,README,*.md,*.txt}; do
          test -f $f && mv $f $doc/
        done
        chmod 444 $dir/theme.conf

        ${lib.concatMapStringsSep "\n" (e: ''
          ${pkgs.crudini}/bin/crudini --set --inplace $dir/theme.conf \
            "${e.section}" "${e.key}" "${e.value}"
        '') themeIni}
      '';
    };

  customTheme = builtins.isAttrs theme;

  theme = themes.sugar-candy;

  themeName = if customTheme
  then theme.pkg.name
  else theme;

  packages = if customTheme
  then [ (buildTheme theme.pkg) ] ++ theme.deps
  else [];

  themes = {

    sugar-candy = {
      pkg = rec {
        name = "sugar-candy";
        version = "c0186b629bf77cfebdc5bee2ec50b23c9107ec56";
        src = pkgs.fetchFromGitHub {
          owner = "caien8";
          repo = "sddm-${name}";
          rev = "${version}";
          sha256 = "1z4ya5y9gkrgf0ckyfqfrbd0l3a8vkqss69r2m26g1b4rzfbxv74";
        };
      };
      deps = with pkgs; [];
    };

    chili = {
      pkg = rec {
        name = "chili";
        version = "0.1.5";
        src = pkgs.fetchFromGitHub {
          owner = "MarianArlt";
          repo = "sddm-${name}";
          rev = version;
          sha256 = "036fxsa7m8ymmp3p40z671z163y6fcsa9a641lrxdrw225ssq5f3";
        };
	themeIni = [
          { section = "General"; key = "background"; value = ./assets/background.jpg; }
        ];
      };
      deps = with pkgs; [];
    };
  };

in
{
  environment.systemPackages = packages;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.theme = themeName;
}

