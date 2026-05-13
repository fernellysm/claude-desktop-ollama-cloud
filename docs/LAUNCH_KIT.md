# Launch Kit

Use this file to promote the project without rewriting the pitch every time.

## GitHub Repo Description

Run Ollama Cloud models inside Claude Desktop's embedded Claude Code sessions on macOS.

## Suggested Topics

```text
claude-desktop
claude-code
ollama
ollama-cloud
deepseek
anthropic
macos
local-ai
ai-agents
developer-tools
```

## One Sentence Hook

I got Claude Desktop's local code sessions running through Ollama Cloud models on macOS, with a rollback-safe wrapper and Keychain-based API key storage.

## Short Launch Post

I packaged a workaround for running Ollama Cloud models inside Claude Desktop's embedded Claude Code sessions on macOS.

It includes:

- one-command install and restore scripts
- Keychain-based API key storage
- model switching via `~/.ollama/config.json`
- a smoke test that proves Desktop-style Claude launches are routed through Ollama

Repo: https://github.com/FernellysM/claude-desktop-ollama-cloud

Launch image:
https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/social-card.png

## X / Threads Post

I got Claude Desktop's embedded Claude Code sessions running through Ollama Cloud models.

Claude Desktop -> wrapper -> Claude Code -> Ollama local gateway -> `deepseek-v4-pro:cloud`

Includes install, smoke test, restore script, and Keychain API key storage.

https://github.com/FernellysM/claude-desktop-ollama-cloud

Demo:
https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/demo.gif

## LinkedIn Post

I turned a local Claude Desktop + Ollama Cloud workaround into a reusable macOS setup.

The repo shows how to route Claude Desktop's embedded Claude Code sessions through Ollama's Anthropic-compatible local gateway, while keeping the Ollama API key in macOS Keychain and preserving a one-command restore path.

This is useful if you want to test models like DeepSeek, Kimi, GLM, or Qwen inside a familiar Claude Desktop code workflow.

Repo: https://github.com/FernellysM/claude-desktop-ollama-cloud

Demo: https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/demo.gif

## Reddit Post

Title:

```text
I got Claude Desktop's local code sessions running through Ollama Cloud models
```

Body:

```text
I packaged the workaround as a small macOS repo.

It does not replace the normal Claude chat model. It targets Claude Desktop's embedded Claude Code / local code sessions by wrapping the helper launch path and routing it through Ollama's local Anthropic-compatible gateway.

What is included:

- install.sh
- restore.sh
- smoke-test.sh
- Keychain-based API key storage
- model switching through ~/.ollama/config.json
- wrapper logs for proof

Repo:
https://github.com/FernellysM/claude-desktop-ollama-cloud

Demo:
https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/demo.gif
```

## Hacker News Title Options

```text
Run Ollama Cloud models inside Claude Desktop's local code sessions
Claude Desktop + Ollama Cloud workaround for macOS
Routing Claude Desktop's embedded Claude Code through Ollama
```

## Demo Proof

README demo:

```text
assets/demo.gif
```

Social card:

```text
assets/social-card.png
```

```sh
./scripts/smoke-test.sh
```

Expected:

```text
ok
routed Claude Code launch to deepseek-v4-pro:cloud via http://127.0.0.1:11434
```

## Keywords

Claude Desktop, Claude Code, Ollama Cloud, DeepSeek, Kimi, Qwen, GLM, Anthropic-compatible API, macOS, local AI agents, developer tools, AI coding agents.
