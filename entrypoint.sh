#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

bundle exec rake db:migrate

if [[ $? != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo

  bundle exec rake db:setup && bundle exec rake db:migrate
fi

export SECRET_KEY_BASE=$(bundle exec rake secret)

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
