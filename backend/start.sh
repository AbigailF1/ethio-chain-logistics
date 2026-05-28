#!/bin/sh
set -eu

export API_PORT="${PORT:-8080}"
exec /app/api
