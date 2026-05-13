#!/usr/bin/env bash
set -euo pipefail

HELPER="/Applications/Claude.app/Contents/Helpers/disclaimer"
VM_CLAUDE="$HOME/Library/Application Support/Claude/claude-code-vm/2.1.128/claude"

if [[ ! -x "$HELPER" ]]; then
  echo "Wrapper/helper not executable: $HELPER" >&2
  exit 1
fi

if [[ ! -e "$VM_CLAUDE" ]]; then
  echo "Claude Desktop VM Claude binary not found: $VM_CLAUDE" >&2
  echo "Open Claude Desktop once, then try again." >&2
  exit 1
fi

"$HELPER" \
  "$VM_CLAUDE" \
  -p "Reply with exactly: ok" \
  --model claude-sonnet-4-6 \
  --effort high \
  --output-format text \
  --dangerously-skip-permissions

echo
echo "Recent wrapper log:"
tail -5 /tmp/claude-desktop-ollama-wrapper.log 2>/dev/null || true

