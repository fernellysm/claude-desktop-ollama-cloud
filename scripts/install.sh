#!/usr/bin/env bash
set -euo pipefail

HELPER_DIR="/Applications/Claude.app/Contents/Helpers"
HELPER="$HELPER_DIR/disclaimer"
REAL_HELPER="$HELPER_DIR/disclaimer.real"
HOST_CLAUDE="${CLAUDE_CODE_HOST_BIN:-$HOME/.local/bin/claude}"
DEFAULT_MODEL="${OLLAMA_CLAUDE_MODEL:-}"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This installer is for macOS." >&2
  exit 1
fi

if [[ ! -d "$HELPER_DIR" ]]; then
  echo "Claude Desktop helper directory not found: $HELPER_DIR" >&2
  exit 1
fi

if [[ ! -x "$HOST_CLAUDE" ]]; then
  echo "Claude Code CLI not found at: $HOST_CLAUDE" >&2
  echo "Install it with: curl -fsSL https://claude.ai/install.sh | bash" >&2
  exit 1
fi

if [[ -z "${OLLAMA_API_KEY:-}" ]]; then
  if ! security find-generic-password -a "${USER:-$(id -un)}" -s "ollama-cloud-api-key" >/dev/null 2>&1; then
    echo "No Ollama Cloud API key found in Keychain." >&2
    echo 'Save it with: security add-generic-password -a "$USER" -s "ollama-cloud-api-key" -w "YOUR_KEY" -U' >&2
    exit 1
  fi
fi

osascript -e 'tell application "Claude" to quit' >/dev/null 2>&1 || true

if [[ ! -f "$REAL_HELPER" ]]; then
  if [[ ! -f "$HELPER" ]]; then
    echo "Original helper not found at $HELPER" >&2
    exit 1
  fi
  mv "$HELPER" "$REAL_HELPER"
  echo "Backed up original helper to $REAL_HELPER"
else
  echo "Original helper backup already exists at $REAL_HELPER"
fi

cat > "$HELPER" <<'SH'
#!/usr/bin/env bash
set -euo pipefail

REAL_HELPER="/Applications/Claude.app/Contents/Helpers/disclaimer.real"
HOST_CLAUDE="${CLAUDE_CODE_HOST_BIN:-$HOME/.local/bin/claude}"
OLLAMA_BASE_URL="${OLLAMA_ANTHROPIC_BASE_URL:-http://127.0.0.1:11434}"

configured_model=""
if [[ -z "${OLLAMA_CLAUDE_MODEL:-}" && -f "$HOME/.ollama/config.json" ]] && command -v jq >/dev/null 2>&1; then
  configured_model="$(jq -r '.integrations.claude.models[0] // empty' "$HOME/.ollama/config.json" 2>/dev/null || true)"
fi
OLLAMA_MODEL="${OLLAMA_CLAUDE_MODEL:-${configured_model:-deepseek-v4-pro:cloud}}"

if [[ ! -x "$REAL_HELPER" ]]; then
  echo "Claude Desktop Ollama wrapper: missing original helper at $REAL_HELPER" >&2
  exit 127
fi

if [[ "${1:-}" == *"/claude-code-vm/"* || "${1:-}" == *"/claude" ]]; then
  if [[ ! -x "$HOST_CLAUDE" ]]; then
    echo "Claude Desktop Ollama wrapper: missing host Claude Code binary at $HOST_CLAUDE" >&2
    exec -a "/Applications/Claude.app/Contents/Helpers/disclaimer" "$REAL_HELPER" "$@"
  fi

  shift

  token="${OLLAMA_API_KEY:-}"
  if [[ -z "$token" ]]; then
    token="$(security find-generic-password -a "${USER:-$(id -un)}" -s "ollama-cloud-api-key" -w 2>/dev/null || true)"
  fi

  export ANTHROPIC_BASE_URL="$OLLAMA_BASE_URL"
  export CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY=1
  export ANTHROPIC_DEFAULT_SONNET_MODEL="$OLLAMA_MODEL"
  export ANTHROPIC_DEFAULT_SONNET_MODEL_NAME="Ollama ${OLLAMA_MODEL}"

  if [[ -n "$token" ]]; then
    export ANTHROPIC_AUTH_TOKEN="$token"
    export ANTHROPIC_API_KEY="$token"
  fi

  rewritten_args=()
  replace_next_model=0
  for arg in "$@"; do
    if [[ "$replace_next_model" == "1" ]]; then
      rewritten_args+=("$OLLAMA_MODEL")
      replace_next_model=0
      continue
    fi

    if [[ "$arg" == "--model" ]]; then
      rewritten_args+=("$arg")
      replace_next_model=1
      continue
    fi

    case "$arg" in
      claude-*|sonnet|opus|haiku)
        rewritten_args+=("$OLLAMA_MODEL")
        ;;
      *)
        rewritten_args+=("$arg")
        ;;
    esac
  done

  printf '%s %s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" "routed Claude Code launch to $OLLAMA_MODEL via $OLLAMA_BASE_URL using $HOST_CLAUDE" >> /tmp/claude-desktop-ollama-wrapper.log
  exec "$HOST_CLAUDE" "${rewritten_args[@]}"
fi

exec -a "/Applications/Claude.app/Contents/Helpers/disclaimer" "$REAL_HELPER" "$@"
SH

chmod +x "$HELPER"
bash -n "$HELPER"

if [[ -n "$DEFAULT_MODEL" ]]; then
  echo "Installed wrapper. Override model for this shell: $DEFAULT_MODEL"
else
  echo "Installed wrapper. It will read ~/.ollama/config.json or fall back to deepseek-v4-pro:cloud."
fi

echo "Next: open Claude Desktop, start a local code session, and watch /tmp/claude-desktop-ollama-wrapper.log"

