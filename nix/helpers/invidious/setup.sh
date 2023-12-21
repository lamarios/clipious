cd ./nix/helpers/invidious

invidious --migrate
# creates a test user with test password
psql -h $POSTGRES_FOLDER -d invidious -f ./users.sql
invidious &
cd -

