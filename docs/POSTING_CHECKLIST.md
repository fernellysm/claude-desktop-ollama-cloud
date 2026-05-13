# Posting Checklist

Use this when launching the repo publicly.

For the owner workflow, launch order, reply templates, and tracking plan, see:

```text
docs/VISIBILITY_PLAYBOOK.md
```

## GitHub Social Preview

The social preview image is already in the repo:

```text
assets/social-card.png
```

Manual upload path:

1. Open https://github.com/FernellysM/claude-desktop-ollama-cloud/settings
2. Scroll to **Social preview**.
3. Click **Edit** or **Upload an image**.
4. Upload:

```text
/Users/maicolmatos/Documents/New project/claude-desktop-ollama-cloud/assets/social-card.png
```

5. Save changes.
6. Verify the Open Graph image after GitHub refreshes its cache:

```sh
gh api graphql \
  -f query='query($owner:String!, $name:String!){ repository(owner:$owner, name:$name){ openGraphImageUrl } }' \
  -f owner=FernellysM \
  -f name=claude-desktop-ollama-cloud \
  --jq '.data.repository.openGraphImageUrl'
```

## Launch Order

Recommended order:

1. Hacker News `Show HN` link post.
2. Reddit `r/LocalLLaMA` text post.
3. Reddit `r/ollama` follow-up later with an Ollama-specific angle.

Avoid posting identical text everywhere at the same time. It reads better when each community gets a slightly tailored version.

## Hacker News

Submit URL:

```text
https://news.ycombinator.com/submit
```

Title:

```text
Show HN: Run Ollama Cloud models inside Claude Desktop's local code sessions
```

URL:

```text
https://github.com/FernellysM/claude-desktop-ollama-cloud
```

## Reddit: r/LocalLLaMA

Submit URL:

```text
https://www.reddit.com/r/LocalLLaMA/submit?type=TEXT
```

Title:

```text
I got Claude Desktop's local code sessions running through Ollama Cloud models
```

Body:

```text
I packaged a macOS workaround for running Ollama Cloud models inside Claude Desktop's embedded Claude Code / local code sessions.

It does not replace the normal Claude chat model. It targets the local code sessions Claude Desktop launches internally, wrapping that helper path and routing it through Ollama's Anthropic-compatible local gateway.

What is included:

- install.sh
- restore.sh
- smoke-test.sh
- Keychain-based API key storage
- model switching through ~/.ollama/config.json
- wrapper logs for proof
- demo GIF and release assets

Repo:
https://github.com/FernellysM/claude-desktop-ollama-cloud

Release:
https://github.com/FernellysM/claude-desktop-ollama-cloud/releases/tag/v0.1.0

Demo:
https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/demo.gif

I tested it with deepseek-v4-pro:cloud. Curious if anyone else has tried other Ollama Cloud models with Claude Desktop's local agent sessions.
```

## Reddit: r/ollama

Submit URL:

```text
https://www.reddit.com/r/ollama/submit?type=TEXT
```

Title:

```text
Claude Desktop local code sessions routed through Ollama Cloud on macOS
```

Body:

```text
I turned a local workaround into a small repo for routing Claude Desktop's embedded Claude Code / local code sessions through Ollama's Anthropic-compatible local gateway.

It keeps the Ollama API key in macOS Keychain, preserves the original Claude Desktop helper for rollback, and includes install/restore/smoke-test scripts.

Repo:
https://github.com/FernellysM/claude-desktop-ollama-cloud

Release:
https://github.com/FernellysM/claude-desktop-ollama-cloud/releases/tag/v0.1.0

Demo:
https://github.com/FernellysM/claude-desktop-ollama-cloud/blob/main/assets/demo.gif

The default tested model is deepseek-v4-pro:cloud, but the wrapper can read a different model from ~/.ollama/config.json.
```
