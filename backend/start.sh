#!/bin/sh
set -eu

export API_PORT="${PORT:-8080}"
if [ -z "${DATABASE_URL:-}" ]; then
	echo "DATABASE_URL is required"
	exit 1
fi

export GOOSE_DRIVER=postgres
export GOOSE_DBSTRING="$DATABASE_URL"

goose -dir /app/migrations up
exec /app/api
