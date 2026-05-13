# Visibility Playbook

This is the owner playbook for helping people discover the repo without sounding spammy.

## Goal

Help macOS users who already use Claude Desktop, Claude Code, or Ollama Cloud find a working workaround, test it, and report which model/configuration worked for them.

The strongest message is:

```text
I got Claude Desktop's local code sessions running through Ollama Cloud models on macOS.
```

Keep the claim precise. This repo targets Claude Desktop's embedded Claude Code / local code sessions. It does not replace normal Claude chat.

## Launch Links

- Repo: https://github.com/FernellysM/claude-desktop-ollama-cloud
- Release: https://github.com/FernellysM/claude-desktop-ollama-cloud/releases/tag/v0.1.0
- Demo GIF: https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/demo.gif
- Social card: https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/social-card.png
- Posting checklist: https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/docs/POSTING_CHECKLIST.md

## Before Posting

Do these first:

1. Upload `assets/social-card.png` as the GitHub social preview image.
2. Pin the repo on your GitHub profile.
3. Make sure the README demo GIF is visible near the top.
4. Keep `v0.1.0` as the first stable release link.
5. Be ready to answer comments for the first 2 hours after posting.

## 7 Day Visibility Plan

### Day 0: GitHub Setup

- Upload the social preview image.
- Pin the repository on your profile.
- Make sure the repo description is short and clear:

```text
Run Ollama Cloud models inside Claude Desktop's embedded Claude Code sessions on macOS.
```

### Day 1: Hacker News

Post one link submission:

```text
Show HN: Run Ollama Cloud models inside Claude Desktop's local code sessions
```

Use the repo URL:

```text
https://github.com/FernellysM/claude-desktop-ollama-cloud
```

First comment, if useful:

```text
Small clarification: this does not replace the normal Claude chat model in Claude Desktop. It targets the embedded Claude Code / local code sessions that Desktop launches internally. The repo includes install, restore, smoke-test scripts, and Keychain-based API key storage.
```

### Day 2: r/LocalLLaMA

Use the `r/LocalLLaMA` draft in `docs/POSTING_CHECKLIST.md`.

Post it as a text post, not a link dump. End with a real question:

```text
Curious if anyone else has tried other Ollama Cloud models with Claude Desktop's local agent sessions.
```

### Day 3: Reply and Improve

Spend time answering questions. Turn repeated questions into README improvements.

Good first follow-up issues:

- Confirm other Ollama Cloud models.
- Confirm other Claude Desktop versions.
- Confirm Intel Mac behavior.
- Add screenshots from real users if they volunteer them.

### Day 4: r/ollama

Use the `r/ollama` draft in `docs/POSTING_CHECKLIST.md`.

Angle it around Ollama:

```text
Ollama's Anthropic-compatible local gateway can route Claude Desktop's embedded Claude Code sessions to a cloud model.
```

### Day 5: X / Threads / LinkedIn

Use the shorter copy from `docs/LAUNCH_KIT.md`.

Best format:

1. One-line hook.
2. Route diagram.
3. What is included.
4. Repo link.
5. Demo GIF link.

### Day 7: Update the Repo

Add a small `Tested Configurations` section to the README if people report working setups.

Suggested table:

```md
| macOS | Claude Desktop | Claude Code | Ollama | Model | Result |
| --- | --- | --- | --- | --- | --- |
| Apple Silicon | 1.6608.0 | 2.1.140 | 0.21.2 | deepseek-v4-pro:cloud | Works |
```

## What to Track

Use GitHub Insights:

- Stars
- Forks
- Watchers
- Clones
- Referrers
- Popular content

Also track:

- Release asset downloads
- Issues opened by users
- Model compatibility reports
- Mentions on Reddit/HN/social

## Reply Templates

When someone says it does not work:

```text
Thanks for testing it. Can you share macOS version, Claude Desktop version, Claude Code version, Ollama version, and the model name? The wrapper log at /tmp/claude-desktop-ollama-wrapper.log is usually the fastest way to see where it stopped.
```

When someone thinks it replaces all Claude Desktop chat:

```text
Small clarification: this targets Claude Desktop's embedded Claude Code / local code sessions, not the normal Claude chat model.
```

When someone worries about safety:

```text
Fair concern. The installer preserves the original helper as disclaimer.real and includes scripts/restore.sh. The Ollama API key is read from macOS Keychain instead of being stored in the repo or wrapper.
```

When someone asks why this exists:

```text
I wanted a quick way to test Ollama Cloud models inside a Claude Desktop local coding workflow while keeping rollback simple.
```

## Tone

Use builder language:

- "I tested this on my Mac."
- "This is an unsupported workaround."
- "Here is the restore path."
- "Please report tested configs."

Avoid overclaiming:

- Do not say it replaces Claude Desktop entirely.
- Do not say it works on every macOS version.
- Do not call it official.
- Do not imply Anthropic or Ollama endorses it.

## Best Conversion Path

The path from stranger to contributor should be:

1. See demo GIF.
2. Read the 30-second version.
3. Run smoke test.
4. Open an issue with their tested configuration.
5. Star the repo if it helped.

