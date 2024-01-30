{ pkgs, ci ? false}:

let

 helpers = {
   postgres = {
      setup = builtins.readFile ./helpers/postgres/init_db.sh;
      clean = builtins.readFile ./helpers/postgres/clean.sh;
      packages = pkgs: [ pkgs.postgresql ];
   };

   invidious = {
     setup = builtins.readFile ./helpers/invidious/setup.sh;
     clean = "pkill invidious";
     packages = pkgs: [ pkgs.invidious ];
   };

 };
in
{
 helpers = helpers;

 packages =
   builtins.concatLists [
   (helpers.postgres.packages pkgs)
   (helpers.invidious.packages pkgs)
 ];

 prepareShell = {setupScripts ? [], cleanupScripts ? [] }: ''
    ######################################################################
    # Create a diretory for the generated artifacts                      #
    ######################################################################

    export NIX_SHELL_DIR=$PWD/.nix-shell
    rm -Rf $NIX_SHELL_DIR
    ''
    + helpers.postgres.setup
    + helpers.invidious.setup
    +
    builtins.concatStringsSep "\n" setupScripts
    + ''

    #clean up will be triggered once the shell exits
    trap \
    "''
    + helpers.postgres.clean
    + helpers.invidious.clean
    + builtins.concatStringsSep "\n" cleanupScripts
    +
    ''
        ########################################################
        # Delete `.nix-shell` directory                        #
        # ----------------------------------                   #
        # The first  step is going  back to the  project root, #
        # otherwise `.nix-shell`  won't get deleted.     #
        ########################################################
        cd $PWD
        rm -rf $PGDATA
        cd $PWD
        rm -rf $NIX_SHELL_DIR
    " \
    EXIT
    '';

}
