######################################################################
# Put the PostgreSQL databases in the project diretory.              #
######################################################################

export POSTGRES_FOLDER=$NIX_SHELL_DIR/db
export NEW_DB_PORT=5433

export DB_DATABASE=invidious

export PGUSER=kemal
export PGPASSWORD="kemal"
export PGHOST="localhost"
export PGPORT=$NEW_DB_PORT
export PGDATABASE=${DB_DATABASE}
export PGROHOST="localhost"


######################################################################
# If database is  not initialized (i.e., $POSTGRES_FOLDER  directory does not #
# exist), then set  it up. Seems superfulous given  the cleanup step #
# above, but handy when one had to force reboot the iron.            #
######################################################################

if ! test -d $POSTGRES_FOLDER
then

  ########################################################
  # Init PostgreSQL                                      #
  #                                                      #
  # NOTE `initdb` vs `createdb`                          #
  # https://stackoverflow.com/questions/50210158/whats-the-difference-between-initdb-usr-local-var-db-and-createdb-db
  # https://www.postgresql.org/docs/current/app-initdb.html
  ########################################################

  pg_ctl initdb -D $POSTGRES_FOLDER

  ########################################################
  # PORT ALREADY IN USE                                  #
  ########################################################
  # If another `nix-shell` is  running with a PostgreSQL #
  # instance,  the logs  will show  complaints that  the #
  # default port 5432  is already in use.  Edit the line #
  # below with  a different  port number,  uncomment it, #
  # and try again.                                       #
  ########################################################

  sed -i "s|^#port.*$|port = 5433|" $POSTGRES_FOLDER/postgresql.conf

fi

########################################################################
# Configure and start PostgreSQL                                       #
# ==================================================================== #
# Setting all  necessary configuration  options via  `pg_ctl` (which   #
# is  basically  a wrapper  around  `postgres`)  instead of  editing   #
# `postgresql.conf` directly with `sed`. See docs:                     #
#                                                                      #
# + https://www.postgresql.org/docs/current/app-pg-ctl.html            #
# + https://www.postgresql.org/docs/current/app-postgres.html          #
#                                                                      #
# See more on the caveats at                                           #
# https://discourse.nixos.org/t/how-to-configure-postgresql-declaratively-nixos-and-non-nixos/4063/1
# but recapping out of paranoia:                                       #
#                                                                      #
# > use `SHOW`  commands to  check the  options because  `postgres -C` #
# > "_returns values  from postgresql.conf_" (which is  not changed by #
# > supplying  the  configuration options  on  the  command line)  and #
# > "_it does  not reflect  parameters supplied  when the  cluster was #
# > started._"                                                         #
#                                                                      #
# OPTION SUMMARY                                                       #
# -------------------------------------------------------------------- #
#                                                                      #
#  + `unix_socket_directories`                                         #
#                                                                      #
#    PostgreSQL  will  attempt  to create  a  pidfile  in              #
#    `/run/postgresql` by default, but it will fail as it              #
#    doesn't exist. By  changing the configuration option              #
#    below, it will get created in $POSTGRES_FOLDER.                            #
#                                                                      #
#   + `listen_addresses`                                               #
#                                                                      #
#     In   tandem  with   edits   in  `pg_hba.conf`   (see             #
#     `HOST_COMMON`  below), it  configures PostgreSQL  to             #
#     allow remote connections (otherwise only `localhost`             #
#     will get  authorized  and  the  rest  of the traffic             #
#     will be discarded).                                              #
#                                                                      #
#     NOTE: the  edit  to  `pga_hba.conf`  needs  to  come             #
#           **before**  `pg_ctl  start`  (or  the  service             #
#           needs to be restarted otherwise), because then             #
#           the changes are not being reloaded.                        #
#                                                                      #
#     More info  on setting up and  troubleshooting remote             #
#     PosgreSQL connections (these are  all mirrors of the             #
#     same text; again, paranoia):                                     #
#                                                                      #
#       + https://stackoverflow.com/questions/24504680/connect-to-postgres-server-on-google-compute-engine
#       + https://stackoverflow.com/questions/47794979/connecting-to-postgres-server-on-google-compute-engine
#       + https://medium.com/scientific-breakthrough-of-the-afternoon/configure-postgresql-to-allow-remote-connections-af5a1a392a38
#       + https://gist.github.com/toraritte/f8c7fe001365c50294adfe8509080201#file-configure-postgres-to-allow-remote-connection-md
#
#   + `log*`                                                           #
#                                                                      #
#     Setting up basic logging,  to see remote connections             #
#     for example.                                                     #
#                                                                      #
#     See the docs for more:                                           #
#     https://www.postgresql.org/docs/current/runtime-config-logging.html
########################################################################

# !!!!!!!!!!!! These are only suitable for development.
# ! INSECURE ! (Not sure if running a production server
# !!!!!!!!!!!!  from `nix-shell` is a good idea anyway:)

HOST_COMMON="host\s\+all\s\+all"
sed -i "s|^$HOST_COMMON.*127.*$|host all all 0.0.0.0/0 trust|" $POSTGRES_FOLDER/pg_hba.conf
sed -i "s|^$HOST_COMMON.*::1.*$|host all all ::/0 trust|"      $POSTGRES_FOLDER/pg_hba.conf



pg_ctl                                                  \
  -D $POSTGRES_FOLDER                                            \
  -l $POSTGRES_FOLDER/postgres.log                               \
  -o "-c unix_socket_directories='$POSTGRES_FOLDER'"             \
  -o "-c listen_addresses='*'"                          \
  -o "-c log_destination='stderr'"                      \
  -o "-c logging_collector=on"                          \
  -o "-c log_directory='log'"                           \
  -o "-c log_filename='postgresql-%Y-%m-%d_%H%M%S.log'" \
  -o "-c log_min_messages=info"                         \
  -o "-c log_min_error_statement=info"                  \
  -o "-c log_connections=on"                            \
  start

# create required datagase
#PGUSER needs to be computer logged in user to for it to work
PGUSER=$(whoami) createdb ${DB_DATABASE} --host=$POSTGRES_FOLDER -p $NEW_DB_PORT

#PGUSER needs to be computer logged in user to for it to work
PGUSER=$(whoami) createuser kemal -s --host=$POSTGRES_FOLDER -p $NEW_DB_PORT
