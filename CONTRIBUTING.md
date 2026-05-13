# Contributing

Thanks for helping test this workaround.

The most useful contributions are compatibility reports. If you try the repo, please share:

- macOS version and CPU type
- Claude Desktop version
- Claude Code CLI version
- Ollama version
- Ollama Cloud model name
- Whether `./scripts/smoke-test.sh` returned `ok`
- Relevant lines from `/tmp/claude-desktop-ollama-wrapper.log`

Do not paste API keys, tokens, private paths, or sensitive logs.

## Good First Contributions

- Report a working Ollama Cloud model.
- Report a Claude Desktop version that works or breaks.
- Improve troubleshooting steps.
- Add screenshots or a short demo, as long as they do not expose secrets.
- Improve the restore path if Claude Desktop changes its helper layout.

## Scope Reminder

This repo targets Claude Desktop's embedded Claude Code / local code sessions on macOS.

It does not replace the normal Claude chat model in Claude Desktop.

