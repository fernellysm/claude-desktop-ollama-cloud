# Security

This project should never store an Ollama API key in the repository.

Use macOS Keychain:

```sh
security add-generic-password \
  -a "$USER" \
  -s "ollama-cloud-api-key" \
  -w "PASTE_YOUR_OLLAMA_API_KEY_HERE" \
  -U
```

Rotate your Ollama API key if it was pasted into:

- chat
- shell history
- screenshots
- public logs
- GitHub
- a shared terminal recording

The wrapper modifies Claude Desktop's app bundle. Use `./scripts/restore.sh` before removing the repository or if Claude Desktop behaves unexpectedly.

