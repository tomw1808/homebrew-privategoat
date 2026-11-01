# PrivateGoat

Private meeting notes and instant Jira for macOS. PrivateGoat records your calls
without a bot joining, transcribes them on your Mac, turns action items into Jira
issues you approve, and gives Claude Code and Codex the context through a local
MCP server. More at [privategoat.app](https://privategoat.app).

This repository holds the Homebrew cask and the release downloads. The app's
source code is not public.

## Install

**Homebrew**

```sh
brew install --cask tomw1808/privategoat/privategoat
```

**Download**

Get [the latest DMG](https://github.com/tomw1808/homebrew-privategoat/releases/latest/download/PrivateGoat.dmg),
open it and drag PrivateGoat to Applications.

Requires macOS 26 on Apple silicon. The app is signed with a Developer ID,
notarized by Apple, and updates itself.

## MCP server for Claude Code, Codex and other agents

PrivateGoat includes a local MCP server (stdio, no network). Your coding agent
reads your recorded meetings, to-dos and your local copy of Jira, right on the
Mac. It never writes to Jira and has no delete tool: an agent can only draft
to-dos, which you review and send yourself.

Settings → Coding agents adds it for you, or run:

```sh
claude mcp add privategoat --scope user -- /Applications/PrivateGoat.app/Contents/MacOS/PrivateGoat --mcp-server
codex mcp add privategoat -- /Applications/PrivateGoat.app/Contents/MacOS/PrivateGoat --mcp-server
```

22 tools: `jira_search`, `jira_issue`, `jira_projects`, `meetings_list`,
`meeting_get`, `todos_list`, `todo_get`, `todo_create`, `todo_update`,
`timeline`, `sessions_for_issue`, `sessions_search`, `kb_list`, `kb_search`,
`kb_read`, `memory_recall`, `memory_search`, `memory_read`, `memory_write`,
`memory_update`, `memory_forget`, `memory_feedback`.

Docs: [The local MCP server](https://privategoat.app/docs/agents/mcp-server/) and
[its tools](https://privategoat.app/docs/agents/mcp-tools/).

## Licence

PrivateGoat is free, with no subscription, and may be used at work. It is
proprietary software: see [LICENSE](LICENSE).

Developed by Thomas Wiesner, me@thomaswiesner.com.
