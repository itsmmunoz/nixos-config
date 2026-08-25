---
description: Execute git commit following Conventional Commits. No body by default; pass "full", "-b" or "--body" to include a detailed body.
agent: build
---

# Git Commit with Conventional Commits

## Default behavior (no arguments)

Generate and execute a **single-line** commit, with no body or footer:

```
<type>[scope]: <description>
```

## When to include a body

Only add a multi-line body with a detailed explanation if the arguments contain
`full`, `-b`, or `--body`. Otherwise, **never** generate a body or footer,
even if the diff is large — summarize everything in the description line.

Arguments received: $ARGUMENTS

## Conventional Commit format

```
<type>[optional scope]: <description>

[optional body]      <- ONLY if body was requested

[optional footer(s)] <- ONLY if body was requested
```

## Commit types

| Type       | Purpose                         |
| ---------- | -------------------------------- |
| `feat`     | New feature                      |
| `fix`      | Bug fix                          |
| `docs`     | Documentation only                |
| `style`    | Formatting/style (no logic)       |
| `refactor` | Code refactor (no feature/fix)    |
| `perf`     | Performance improvement           |
| `test`     | Add/update tests                  |
| `build`    | Build system/dependencies         |
| `ci`       | CI/config changes                 |
| `chore`    | Maintenance/misc                  |
| `revert`   | Revert a commit                   |

## Breaking changes

```
feat!: remove deprecated endpoint
```
or with a `BREAKING CHANGE: ...` footer (only if the full body was requested).

## Workflow

### 1. Analyze diff

Current repo status:

!`git status --porcelain`

Staged diff:

!`git diff --staged`

Working tree diff (if nothing staged):

!`git diff`

### 2. Stage files (if needed)

```bash
git add path/to/file1 path/to/file2
git add -p
```

**Never commit secrets** (.env, credentials.json, private keys).

### 3. Generate the message

- **Type**: what kind of change is this?
- **Scope**: what area/module is affected? (optional)
- **Description**: one-line summary, present tense, imperative mood, <72 chars
- **Body**: ONLY if arguments requested a body → explain the "what" and "why"

### 4. Execute the commit

Without description (default behavior):

```bash
git commit -m "<type>[scope]: <description>"
```

With body (if arguments included `full`/`-b`/`--body`):

```bash
git commit -m "$(cat <<'EOF'
<type>[scope]: <description>

<body explaining the change>

<optional footer, e.g. Closes #123>
EOF
)"
```

## Best practices

- One logical change per commit
- Present tense: "add" not "added"
- Imperative mood: "fix bug" not "fixes bug"
- Reference issues: `Closes #123`, `Refs #456`
- Keep description under 72 characters

## Git Safety Protocol

- NEVER update git config
- NEVER run destructive commands (`--force`, hard reset) without explicit request
- NEVER skip hooks (`--no-verify`) unless user asks
- NEVER force push to main/master
- If commit fails due to hooks, fix and create a NEW commit (don't amend)
