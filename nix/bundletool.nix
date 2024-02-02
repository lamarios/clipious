# Using a fixed nix commit for maximum reproducability
{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
    config.allowBroken = true;
  }
, ci ? false}:
pkgs.mkShell {
  buildInputs = with pkgs; [
  bundletool aapt android-tools
  ];

  LOCALE_ARCHIVE = if pkgs.stdenv.isLinux then "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
}

# vim: set tabstop=2 shiftwidth=2 expandtab:
