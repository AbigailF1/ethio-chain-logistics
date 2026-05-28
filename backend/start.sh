#!/bin/sh
set -eu

export API_PORT="${PORT:-8080}"
goose -dir /app/migrations postgres "$DATABASE_URL" up
exec /app/api
