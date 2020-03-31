#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

bundle exec rails db:migrate

if [[ $? != 0 ]]; then
  echo
  echo "== Failed to migrate. Running setup first."
  echo

  bundle exec rails db:setup && bundle exec rails db:migrate
fi

# shellcheck disable=SC2155
export SECRET_KEY_BASE=$(bundle exec rails secret)

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
