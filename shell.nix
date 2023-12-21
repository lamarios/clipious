# Using a fixed nix commit for maximum reproducability
{ pkgs ? import <nixpkgs> {
    config.allowUnfree = true;
    config.allowBroken = true;
  }
, ci ? false}:

let
  clipiousNix = import  ./nix/clipious.nix {
    ci = ci;
    pkgs = pkgs;
  };


in
pkgs.mkShell {
  buildInputs = with pkgs; builtins.concatLists [
    clipiousNix.packages
    [ flutter git ]
  ];

  # What to run when the shell starts
  # clipiousNix.prepareShell is a helper function to sort things properly. It returns a string so it's possible to just concatenate stuff afterwards
  # to run CI or DB migrations
  shellHook = (clipiousNix.prepareShell {}) + ''
  git submodule init
  git submodule update

  # setup/update pre-hook commits
  ./submodules/flutter/bin/dart run tools/setup_git_hooks.dart
  ./submodules/flutter/bin/flutter doctor
  ''
  +(if ci then "./submodules/flutter/bin/flutter test" else "")
  ;


  ####################################################################
  # Without  this, almost  everything  fails with  locale issues  when
  # using `nix-shell --pure` (at least on NixOS).
  # See
  # + https://github.com/NixOS/nix/issues/318#issuecomment-52986702
  # + http://lists.linuxfromscratch.org/pipermail/lfs-support/2004-June/023900.html
  ####################################################################

  LOCALE_ARCHIVE = if pkgs.stdenv.isLinux then "${pkgs.glibcLocales}/lib/locale/locale-archive" else "";
}

# vim: set tabstop=2 shiftwidth=2 expandtab: