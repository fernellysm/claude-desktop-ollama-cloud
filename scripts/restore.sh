#!/usr/bin/env bash
set -euo pipefail

HELPER_DIR="/Applications/Claude.app/Contents/Helpers"
HELPER="$HELPER_DIR/disclaimer"
REAL_HELPER="$HELPER_DIR/disclaimer.real"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This restore script is for macOS." >&2
  exit 1
fi

osascript -e 'tell application "Claude" to quit' >/dev/null 2>&1 || true

if [[ ! -f "$REAL_HELPER" ]]; then
  echo "No backup helper found at $REAL_HELPER"
  echo "Nothing to restore."
  exit 0
fi

mv "$REAL_HELPER" "$HELPER"
chmod +x "$HELPER"
echo "Restored original Claude Desktop helper."

