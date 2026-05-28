#!/bin/sh
set -eu

export API_PORT="${PORT:-8080}"
if [ -z "${DATABASE_URL:-}" ]; then
	echo "DATABASE_URL is required"
	exit 1
fi

export GOOSE_DRIVER=postgres
export GOOSE_DBSTRING="$DATABASE_URL"
export GOOSE_MIGRATION_DIR=/app/migrations

goose up
exec /app/api
