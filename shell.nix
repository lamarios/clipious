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
 aliases = [
         {
             name = "build-runner";
             command = "dart run build_runner build --delete-conflicting-outputs";
             description = "Run code generation once";
         }
         {
             name = "build-runner-watch";
             command = "dart run build_runner watch --delete-conflicting-outputs";
             description = "Watch for changes and run code generation";
         }
     ];


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

  echo "Setting up submodules"
  git submodule init
  git submodule update

  echo "Setting up pre-commit hook"
  dart run tools/setup_git_hooks.dart

  "Adding flutter submodule to path"
  export PATH="./submodules/flutter/bin:$PATH"

  echo "creating useful aliases..."


  flutter config --jdk-dir ${pkgs.jdk21}/lib/openjdk

  ''+
  pkgs.lib.concatStrings (map (x: ''alias ${x.name}="${x.command}";'') aliases)
  +''
  echo -e "\nAll done 🎉 \nAvailable aliases:"
  ''+
          pkgs.lib.concatStrings (map (x: ''echo "${x.name}: ${x.description}";'') aliases);



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