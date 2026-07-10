# 💤 Neovim Configuration

An opinionated Neovim setup built on [LazyVim](https://lazyvim.org) and
managed by [chezmoi](https://chezmoi.io) as part of
[pdehlke/dotfiles](https://github.com/pdehlke/dotfiles).

It extends LazyVim rather than replacing it: 36 extras provide language
support and core behavior, and 31 custom plugin specs layer on a
floating-window workflow, a solarized look, and deliberately restrained AI
integration. For LazyVim's base features, see the
[official documentation](https://www.lazyvim.org).

| Component   | Detail                                 |
| ----------- | -------------------------------------- |
| Neovim      | v0.12.0                                |
| Framework   | LazyVim v16.0.0                        |
| Plugins     | 95 locked (36 extras, 31 custom specs) |
| Colorscheme | solarized.nvim (autumn variant, dark)  |
| Platform    | macOS (also runs on Raspberry Pi)      |
| License     | Apache 2.0                             |

<details>
<summary>Table of Contents</summary>

* [Installation](#installation)
* [Requirements](#requirements)
* [Layout](#layout)
* [Design Highlights](#design-highlights)
* [LazyVim Extras](#lazyvim-extras)
* [Custom Plugins](#custom-plugins)
* [Keymaps](#keymaps)
* [Options](#options)
* [Autocmds](#autocmds)
* [Utility Modules](#utility-modules)
* [License](#license)
* [Credits](#credits)

</details>

---

## Installation

This config is not installed by cloning it into place. chezmoi applies it
to `~/.config/nvim/` from the dotfiles source tree:

```
~/.yadr/root/private_dot_config/nvim/   # source of truth (chezmoi)
~/.config/nvim/                         # deployed target
```

```sh
# apply the dotfiles (includes this config)
chezmoi apply --verbose

# edit a file through chezmoi (edits source, applies on save)
cze ~/.config/nvim/lua/config/options.lua
```

On first launch, lazy.nvim bootstraps itself and installs every plugin.
Plugins also auto-update at startup (a `VimEnter` autocmd runs
`lazy.update()` when updates exist), so `lazy-lock.json` drifts over time;
it is machine-local and intentionally outside chezmoi management.

Standalone use works too: the tree has no hard chezmoi dependency, so
copying it to `~/.config/nvim` on another machine is enough.

### Post-install

* `:checkhealth` verifies dependencies (headless: `nvim +checkhealth +qa`)
* `:Lazy` manages plugins; `:Mason` manages language tooling
* `:LazyExtras` manages the enabled LazyVim extras

## Requirements

Everything in
[LazyVim's requirements](https://www.lazyvim.org/#%EF%B8%8F-requirements)
(Neovim, git, a Nerd Font, ripgrep, fd, a C compiler), plus:

* `yazi` for the floating file manager (`<leader>y`)
* `direnv` for per-directory environments (loaded before all other plugins)
* kitty or Neovide: the Alt-key word motions rely on kitty's escape
  sequences; Neovide reproduces them via right-Option-as-meta
* a Go toolchain: `<leader>ce` auto-installs the `iferr` helper on first use

## Layout

```
~/.config/nvim/
  init.lua                 # entry point: require("config.lazy")
  lazyvim.json             # 36 enabled LazyVim extras
  lazy-lock.json           # 95 locked plugins (machine-local)
  stylua.toml              # 4-space indent, 120-col width
  syntax/gotmpl.vim        # Go-template overlay applied by autocmd
  lua/
    config/
      lazy.lua             # bootstrap; direnv.nvim loads first
      options.lua          # editor options, fully commented
      keymaps.lua          # custom keybindings
      autocmds.lua         # highlight overrides + functional autocmds
    plugins/               # 31 plugin spec files, one per plugin
    util/                  # close_or_alpha, go_iferr, man_hover
```

## Design Highlights

* Floating-preview paradigm: LSP navigation, code actions, man pages,
  diagnostics, terminals, and the AI CLI all render in floating windows
  instead of quickfix lists or splits.
* Environment-first bootstrap: direnv.nvim loads before every other plugin
  so the rest of the config sees direnv-managed environment variables.
* Theme-agnostic highlights: ~100 highlight groups are reapplied after
  every colorscheme change (barbar tab matrix, completion kind colors,
  spell undercurl, and more).
* Opt-in Copilot: completions are off by default; a clickable lualine
  component toggles `b:copilot_enabled` per buffer, which gates the
  blink.cmp source.
* Yank-only clipboard: `clipboard=""` plus a `TextYankPost` autocmd means
  yanks reach the macOS pasteboard but deletes and changes never do.
* Smart buffer lifecycle: closing the last buffer falls back to the Alpha
  dashboard instead of an empty session.
* Click-driven status column: gitsigns preview/stage/reset, DAP breakpoint
  toggles, and fold controls are all mouse-accessible from the gutter.
* Terminal/GUI parity: kitty escape-sequence keymaps and a dedicated
  Neovide block converge on identical Alt-key and clipboard behavior.
* Disabled-plugin convention: specs are kept on disk with
  `enabled = false` (or `if true then return {} end`) and a comment
  explaining why, so the rationale travels with the config.

## LazyVim Extras

36 extras enabled (from `lazyvim.json`). Manage with `:LazyExtras`; docs at
<https://www.lazyvim.org/extras>.

| Category   | Extras                                                                                                                  | Count |
| ---------- | ----------------------------------------------------------------------------------------------------------------------- | ----: |
| AI         | copilot, sidekick                                                                                                       |     2 |
| Coding     | luasnip, yanky                                                                                                          |     2 |
| DAP        | core, nlua                                                                                                              |     2 |
| Editor     | aerial, illuminate, inc-rename, neo-tree                                                                                |     4 |
| Formatting | black, prettier                                                                                                         |     2 |
| Languages  | ansible, clangd, cmake, docker, git, go, java, json, markdown, python, sql, tailwind, terraform, toml, typescript, yaml |    16 |
| Test       | core                                                                                                                    |     1 |
| UI         | alpha, edgy, mini-animate, treesitter-context                                                                           |     4 |
| Util       | dot, mini-hipatterns, project                                                                                           |     3 |

## Custom Plugins

One spec file per plugin in `lua/plugins/`; LazyVim loads them
automatically.

### Theme & visual

| Plugin               | Summary                                                                                                                                                                            |
| -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| solarized.nvim       | Autumn variant, dark background, bold styles on most syntax classes, italic comments, SpellBad forced to undercurl                                                                 |
| barbecue.nvim        | VS Code-style winbar breadcrumbs via nvim-navic                                                                                                                                    |
| lualine              | Extends LazyVim defaults with mutagen sync status, direnv status, clickable per-buffer Copilot toggle, per-language version readouts (Go/Node/Java/Python), sorted LSP client list |
| barbar               | Buffer tabline with git/diagnostic icons; replaces bufferline.nvim                                                                                                                 |
| alpha-nvim           | NEOVIM header, time-based greeting, fortune quotes, 10 buttons, dynamic vertical centering, scrolling fully locked                                                                 |
| statuscol + nvim-ufo | Three-segment gutter (DAP signs, line numbers, gitsigns) with click handlers; treesitter+indent folding with line-count fold text                                                  |
| mini.animate         | Window-open animation only; everything else disabled                                                                                                                               |
| noice                | Cmdline popup, bordered LSP docs, auto-opening signature help, routes silencing img-clip/Mason/Snacks chatter                                                                      |
| which-key            | Helix preset                                                                                                                                                                       |
| edgy                 | Exit-when-last plus styled window separators                                                                                                                                       |

### LSP & completion

| Plugin                 | Summary                                                                                                                                            |
| ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| nvim-lspconfig         | Custom diagnostic signs, no virtual text, severity sort; all LSP nav keys rerouted to goto-preview (see Keymaps)                                   |
| blink.cmp              | Fully manual completion (no preselect, no auto-insert, ghost text off), Tab/S-Tab + C-j/C-k selection, CR accepts; Copilot source gated per buffer |
| copilot.lua            | Telemetry off; effectively opt-in per buffer via the lualine toggle                                                                                |
| mason                  | Rounded borders; mason-extra-cmds provides `:MasonUpdateAll`                                                                                       |
| tiny-code-action       | Code-action preview with Snacks picker and vim diff backend                                                                                        |
| tiny-inline-diagnostic | Modern preset, multiline signs with cursor-only messages, zero throttle                                                                            |
| goto-preview           | 120x15 floating previews for all LSP navigation; telescope dropdown for references; stacked previews, `q`/`gP` unwind                              |

### Navigation & search

| Plugin     | Summary                                                                                                                               |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| neo-tree   | Close-if-last, `Y` copy-path selector (5 formats), floating preview with image support, libuv file watcher, hidden files shown dimmed |
| telescope  | Horizontal layout, top prompt, ascending sort; extra pickers for buffer fuzzy find, projects, and plugin files                        |
| searchbox  | Search/replace UI on `<leader>s.`                                                                                                     |
| yanky      | `-p`/`-P` put-with-filter mappings                                                                                                    |
| illuminate | Cursor-word highlighting with a denylist for UI filetypes                                                                             |

### Code execution & tools

| Plugin           | Summary                                                                                                         |
| ---------------- | --------------------------------------------------------------------------------------------------------------- |
| code-runner      | Runs 15 filetypes in toggleterm; interactive compile-flags/args runner; per-project commands in `projects.json` |
| toggleterm       | Floating terminals; `Alt-z` toggles, and from terminal mode closes all terminals                                |
| codesnap         | Code screenshots to clipboard or `~/Downloads` (CaskaydiaCove font, breadcrumbs)                                |
| markdown-preview | Browser preview with dark theme, `<leader>cp` in markdown buffers                                               |
| ts-comments      | Native `gc` commenting with `<leader>/` toggle; Comment.nvim is disabled (nil-commentstring crash on 0.12)      |
| guess-indent     | Per-file indent detection, editorconfig respected                                                               |
| nvim-lint        | markdownlint-cli2 pointed at `~/.markdownlint-cli2.yaml`                                                        |
| uv.nvim          | uv-based Python environment and script workflow with Snacks picker integration                                  |

### AI & environment

| Plugin        | Summary                                                                                                                            |
| ------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| sidekick.nvim | `Alt-a` attaches to a running AI CLI session or opens opencode in a 90%x85% float; `Alt-Tab` applies Copilot next-edit suggestions |
| direnv.nvim   | Loads before LazyVim core so plugin configs inherit the direnv environment; statusline component and `<leader>d*` keymaps          |

## Keymaps

Custom keymaps live in `lua/config/keymaps.lua`; LazyVim's defaults are
documented at [lazyvim.org/keymaps](https://www.lazyvim.org/keymaps).
`Space` is mapped to `<Nop>` (normal, visual) to avoid leader races.

### Unmapped LazyVim defaults

| Key                         | Original action         | Replacement                   |
| --------------------------- | ----------------------- | ----------------------------- |
| `<leader>bb`                | Switch to other buffer  | barbar navigation             |
| `<leader>bo`                | Delete other buffers    | barbar `<leader>ba`           |
| `<leader>bd` / `<leader>bD` | Delete buffer (/ force) | `Alt-c` / `Alt-C` smart close |
| `<leader>fn`                | New file                | `<leader>bn`                  |
| `<leader>K`                 | Keywordprg              | not needed                    |
| `<leader>\|`                | Split window right      | `<leader>\`                   |

### Kitty terminal integration

kitty sends escape sequences for Option keys; keymaps translate them in
all relevant modes. Neovide matches this via right-Option-as-meta.

```conf
map alt+left      send_text all \x1b\x62    # ⌥← word left  (M-b)
map alt+right     send_text all \x1b\x66    # ⌥→ word right (M-f)
map alt+backspace send_text all \x1b\x7f    # ⌥⌫ delete word
map alt+up        send_text all \x1b[F      # ⌥↑ end of line
map alt+down      send_text all \x1b[H      # ⌥↓ start of line
```

| Keys                      | Modes                           | Action               |
| ------------------------- | ------------------------------- | -------------------- |
| `⌥←` / `⌥→` (`M-b`/`M-f`) | normal, visual, insert, cmdline | Word left / right    |
| `⌥↑` / `⌥↓` (End / Home)  | all                             | End / start of line  |
| `⌥⌫`                      | insert, cmdline                 | Delete previous word |

### Buffers & windows

| Key                        | Action                                                    |
| -------------------------- | --------------------------------------------------------- |
| `Alt-c` / `Alt-C`          | Close buffer (smart, Alpha fallback) / force close        |
| `Tab` / `Shift-Tab`        | Next / previous buffer                                    |
| `Alt-1`…`Alt-9`, `Alt-0`   | Jump to buffer 1-9 / buffer 0                             |
| `Alt-p`                    | Pin/unpin buffer                                          |
| `Alt-<` / `Alt->`          | Move buffer left / right                                  |
| `<leader>ba` / `bp` / `bP` | Close all but current / unpinned / all but current+pinned |
| `<leader>bs[b\|d\|l\|w]`   | Sort buffers by number / directory / language / window    |
| `<leader>bn`               | New file                                                  |
| `<leader>bA`               | Add current directory as project                          |
| `<leader>\`                | Split window right                                        |

### Editing & clipboard

| Key                          | Action                                        |
| ---------------------------- | --------------------------------------------- |
| `<leader>W`                  | Save without formatting (`:noautocmd w`)      |
| `Ctrl-c`                     | Copy file (normal) / selection (visual)       |
| `Ctrl-x`                     | Delete file (normal) / cut selection (visual) |
| `Tab` / `Shift-Tab` (visual) | Indent / dedent, keeping selection            |
| `+` / `=`                    | Increment / decrement number                  |
| `<leader>/`                  | Toggle comment (normal, visual)               |
| `<leader>ce`                 | Go: insert `if err != nil` block              |

### Search & files

| Key                         | Action                                     |
| --------------------------- | ------------------------------------------ |
| `<leader>fw`                | Grep all files (Snacks picker, needs `rg`) |
| `<leader>f/`                | Fuzzy find in current buffer               |
| `<leader>fp` / `<leader>fP` | Projects picker / find plugin file         |
| `<leader>s.`                | Search and replace in current buffer       |
| `-p` / `-P`                 | Yanky put after / before with filter       |

### LSP navigation

LazyVim's default LSP keys are unmapped for every server and replaced
with goto-preview floating windows:

| Key          | Action                  | Plugin                   |
| ------------ | ----------------------- | ------------------------ |
| `gd`         | Definition preview      | goto-preview             |
| `gr`         | References preview      | goto-preview + telescope |
| `gI`         | Implementation preview  | goto-preview             |
| `gy`         | Type definition preview | goto-preview             |
| `gD`         | Declaration preview     | goto-preview             |
| `gh`         | Hover documentation     | native LSP (via noice)   |
| `gm`         | Man page hover          | custom util              |
| `gP`         | Close all previews      | goto-preview             |
| `<leader>ca` | Code action (n, v)      | tiny-code-action         |
| `<leader>cA` | Source action           | tiny-code-action         |

### Code runner

| Key                         | Action                                           |
| --------------------------- | ------------------------------------------------ |
| `<leader>rr` / `rf` / `rp`  | Run code / file / project                        |
| `<leader>ra`                | Run with compiler flags + runtime args (prompts) |
| `<leader>rP`                | Configure projects                               |
| `<leader>rm[t\|f\|T\|o\|b]` | Run in term / float / tab / toggleterm / buffer  |

### Terminals, AI & tools

| Key                   | Action                                              |
| --------------------- | --------------------------------------------------- |
| `<leader>y`           | Yazi file manager (floating terminal)               |
| `Alt-z`               | Toggle floating terminal; closes all from term mode |
| `Alt-a`               | Sidekick AI CLI (attach, or open opencode)          |
| `Alt-Tab`             | Jump to / apply Copilot next edit suggestion        |
| `<leader>da/dd/dr/de` | direnv allow / deny / reload / edit                 |
| `<leader>cpc` / `cps` | CodeSnap to clipboard / to `~/Downloads` (visual)   |
| `<leader>cp`          | Markdown preview (markdown buffers)                 |

### Quit

| Key                         | Action                           |
| --------------------------- | -------------------------------- |
| `Ctrl-q`                    | Quit all (confirm)               |
| `<leader>qq` / `<leader>qQ` | Quit window / quit all (confirm) |

## Options

Set in `lua/config/options.lua`; every setting carries an explanatory
comment. Notable divergences from LazyVim defaults:

| Option               | Value         | Note                                                      |
| -------------------- | ------------- | --------------------------------------------------------- |
| timeoutlen           | 1000          | Neovim default restored (LazyVim sets 300ms)              |
| clipboard            | ""            | `unnamedplus` off; yank-only sync via autocmd             |
| shiftwidth / tabstop | 4 / 4         | LazyVim defaults to 2                                     |
| relativenumber       | true          | For count-prefixed motions like 5j / 12k                  |
| wrap                 | true          | Soft wrap with `↪ ` showbreak (LazyVim: nowrap)           |
| conceallevel         | 0             | Show all symbols                                          |
| updatetime           | 200           | Faster CursorHold                                         |
| sessionoptions       | +localoptions | persistence.nvim restores buffer-local opts (spelllang)   |
| listchars + list     | on            | nbsp, precedes/extends, tab, conceal, trailing markers    |
| guicursor            | per-mode      | Block (n/v/c), bar (insert), underscore (replace), themed |
| g.snacks_animate    | false         | mini.animate is the single animation source               |

Also in options.lua:

* Markdown-only autowrap: `textwidth=80` + `colorcolumn=80` in markdown
  buffers, cleared elsewhere.
* Plugin auto-update at startup via a `VimEnter` autocmd.
* A Neovide block: Cmd-S/Cmd-C/Cmd-V, JetBrainsMono Nerd Font, 120Hz
  refresh, animations zeroed, and right Option as meta (left Option still
  types special characters).

## Autocmds

`lua/config/autocmds.lua` has two halves.

A highlight override system runs at startup and after every colorscheme
change (deferred with `vim.schedule` so it wins over theme callbacks):
barbar's full tab color matrix and CursorLine/Visual from the solarized
palette, transparent blink.cmp menus, VS Code-style completion and Aerial
kind colors, DAP virtual-text colors, window separators, Neo-tree dotfile
dimming, spell undercurl, gray inlay hints, and the Alpha dashboard groups.

Functional autocmds:

* `TextYankPost` copies yanks (operator `y` only) to the system clipboard,
  pairing with `clipboard=""` for the yank-only clipboard discipline.
* Spell check disabled in markdown buffers.
* Go template highlighting: `*.<ext>.tmpl` files get the inner extension's
  filetype plus a `{{ }}` / `{% %}` overlay from `syntax/gotmpl.vim`.
* Mason auto-update (`:MasonUpdate` + `:MasonUpdateAll`) after Lazy sync.

## Utility Modules

### close_or_alpha.lua

Smart buffer close behind `Alt-c` / `Alt-C`. Deletes the buffer if other
windows show normal files; on the last normal window it switches to the
next listed buffer first, and when none remains it opens the Alpha
dashboard instead of leaving an empty session. Supports force close.

### go_iferr.lua

Inserts a Go `if err != nil` block at the cursor (`<leader>ce`).
Auto-installs the `iferr` binary via `go install` on first use,
auto-indents, and honors `g:go_iferr_vertical_shift`.

### man_hover.lua

Opens the man page for the word under the cursor in a floating window
(`gm`), using `vim.lsp.util.open_floating_preview`. `q` closes and returns
focus. Useful for C/shell/POSIX work; for LSP-backed languages use `gh`.

## License

Apache 2.0 — see [`LICENSE`](./LICENSE).

## Credits

Built on [LazyVim](https://github.com/LazyVim/LazyVim) and the Neovim
plugin ecosystem. Originally bootstrapped from
[av1155/nvim](https://github.com/av1155/nvim); long since diverged.
