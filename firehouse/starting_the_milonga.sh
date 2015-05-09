#!/bin/bash

psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -U postgres \
    -c "CREATE ROLE firehouse WITH SUPERUSER \
     CREATEDB CREATEROLE LOGIN ENCRYPTED \
     PASSWORD 'firehouse' NOINHERIT VALID UNTIL 'infinity';"

export RAILS_ENV=production
cd /firehouse
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake assets:precompile
bundle exec rake db:seed

mkdir -p uploads
mkdir -p tmp/uploads
