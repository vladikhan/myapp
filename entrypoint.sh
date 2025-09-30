#!/bin/bash
set -e

# Удаляем файл server.pid, если он существует.
rm -f /myapp/tmp/pids/server.pid

# Выполняем миграции базы данных.
echo "Running database migrations..."
bundle exec rails db:migrate

# Затем выполняем основную команду контейнера (CMD).
echo "Starting main process..."
exec "$@"
