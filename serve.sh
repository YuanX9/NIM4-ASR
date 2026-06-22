#!/usr/bin/env bash
#
# Serve the NIM4-ASR site locally for preview.
#
#   ./serve.sh            # serve on http://localhost:6006
#   ./serve.sh 8080       # serve on a different port
#
set -euo pipefail

# Always serve from the directory this script lives in (the repo root),
# regardless of where it's invoked from.
cd "$(dirname "$0")"

PORT="${1:-6006}"

if command -v python3 >/dev/null 2>&1; then
  PY=python3
elif command -v python >/dev/null 2>&1; then
  PY=python
else
  echo "Error: python3 (or python) is required but was not found." >&2
  exit 1
fi

echo "Serving $(pwd)"
echo "  -> http://localhost:${PORT}/"
echo "Press Ctrl+C to stop."

# -u: unbuffered output so request logs appear immediately.
exec "$PY" -u -m http.server "$PORT" --bind 127.0.0.1
