---
name: chezmoi-settings-sync
description: Sync ~/.claude/settings.json changes back to the chezmoi source template. Load whenever editing ~/.claude/settings.json directly, or after any operation that may have mutated it (plugin installs, permission changes, config updates). Triggers on: edit settings.json, update claude settings, add permission, install plugin, configure claude code.
allowed-tools: Read Edit Bash(chezmoi *)
---

# chezmoi-settings-sync

`~/.claude/settings.json` is managed by chezmoi. The source template is at:

```
~/.yadr/root/dot_claude/private_settings.json.tmpl
```

The template contains Go template expressions that **must be preserved**:

```
{{ .chezmoi.homeDir }}  — appears in hook commands and plugin paths
```

## Rule

**Never use `chezmoi add ~/.claude/settings.json`** — it overwrites the template with literal values, destroying template expressions.

Always merge changes manually into the template.

## Workflow: I edited ~/.claude/settings.json directly

1. Check drift:
   ```bash
   chezmoi diff ~/.claude/settings.json
   ```
   - `-` lines = live file content (what you want to keep)
   - `+` lines = what the template currently renders

2. For each `-` line (live file has, template doesn't): add to template, preserving any `{{ .chezmoi.homeDir }}` substitutions for home directory paths.

3. For each `+` line (template has, live file doesn't): remove from template.

4. Verify:
   ```bash
   chezmoi diff ~/.claude/settings.json
   ```
   Should show only whitespace/formatting differences, or nothing.

## Workflow: I want to edit settings via template (preferred)

1. Edit the template directly:
   ```bash
   cze ~/.claude/settings.json   # opens source template in $EDITOR, applies on save
   ```
   Or edit `/Users/pde/.yadr/root/dot_claude/private_settings.json.tmpl` directly.

2. Apply:
   ```bash
   chezmoi apply ~/.claude/settings.json
   ```

## Known template expressions

| Location | Expression | Renders to |
|----------|-----------|------------|
| SessionStart hook command | `{{ .chezmoi.homeDir }}` | `/Users/pde` |
| SessionEnd hook command | `{{ .chezmoi.homeDir }}` | `/Users/pde` |
| vercel plugin path | `{{ .chezmoi.homeDir }}` | `/Users/pde` |

## Note on plugin/marketplace operations

Claude Code's `/plugin marketplace add` and similar commands write `settings.json` directly — not through Claude's Edit/Write tools. These will always cause drift. Run `chezmoi diff ~/.claude/settings.json` periodically and sync manually.
