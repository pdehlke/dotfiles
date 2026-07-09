# Neovim Configuration: Complete Analysis

> Comprehensive audit of this Neovim + LazyVim configuration, as of July 2026.
> Covers config files, plugin inventory, keymap architecture, and full
> plugin-documentation cross-reference.

---

## Environment

- Neovim: **v0.12.0** (Release, LuaJIT 2.1.1774896198)
- Framework: **LazyVim v16.0.0** (stable, 2026-06-02)
- Plugin manager: **lazy.nvim** (stable branch)
- Platform: macOS Darwin 25.5.0 (also runs on Raspberry Pi; see lazy.lua concurrency handling)
- Formatter: StyLua (4-space indent, 120 col width)
- Source of truth: chezmoi source tree at `~/.yadr/root/private_dot_config/nvim/`, applied to `~/.config/nvim/`

---

## Directory Structure

Paths below are the deployed names; the chezmoi source uses `dot_` prefixes
(`dot_gitignore` -> `.gitignore`, `dot_neoconf.json` -> `.neoconf.json`).

```
~/.config/nvim/
  init.lua                      # Entry point: require("config.lazy")
  lazyvim.json                  # 36 enabled LazyVim extras
  lazy-lock.json                # 95 locked plugins (deployed dir only, not in chezmoi source)
  .gitignore                    # tt.*, .tests, debug, .repro, *.log, data
  .neoconf.json                 # neodev library + lua_ls plugin enabled
  stylua.toml                   # 4 spaces, 120 col width
  AGENTS.md                     # Agent instructions (build/lint/style conventions)
  LICENSE                       # Apache 2.0
  ansi/gopher.sh                # ANSI-art gopher shell script (executable)
  syntax/gotmpl.vim             # Go template syntax, included by autocmd for *.tmpl
  lua/
    config/
      lazy.lua                  # Bootstrap lazy.nvim; direnv.nvim loads before all other plugins
      options.lua               # Editor options, fully commented (4-tab, relnumber, wrap, Neovide)
      keymaps.lua               # 207 lines of custom keybindings
      autocmds.lua              # 279 lines: highlight overrides + functional autocmds
    plugins/                    # 35 plugin spec files
      alpha.lua
      avante.lua                # DISABLED
      barbar.lua
      barbeque.lua              # barbecue.nvim (also spec'd in colorscheme.lua)
      blink-cmp.lua
      code-runner.lua
      codesnap.lua
      colorscheme.lua           # solarized.nvim + duplicate barbecue spec
      comment.lua               # Comment.nvim disabled; ts-comments keymaps
      copilot.lua
      edgy.lua
      goto-preview.lua
      guess-indent.lua
      illuminate.lua
      lsp-config.lua
      lualine.lua
      markdown-preview.lua
      mason.lua
      mini-animate.lua
      neo-tree.lua
      noice.lua
      nvim-lint.lua
      opencode-nvim.lua         # DISABLED
      opencode-terminal.lua     # DISABLED
      searchbox.lua
      sidekick.lua
      statuscol.lua             # also: snacks statuscolumn off, gitsigns, nvim-ufo
      telescope.lua
      tiny-code-action.lua
      tiny-inline-diagnostic.lua
      toggleterm.lua
      ui.lua                    # bufferline opts (dead), which-key dup, extra noice routes
      vivify.lua                # vivify.vim markdown previewer
      which-key.lua
      yanky.lua
      code_runner/projects.json # Project configs (Dockitect: pnpm run dev)
    util/
      close_or_alpha.lua        # Smart buffer close, fallback to Alpha
      go_iferr.lua              # Go "if err != nil" snippet inserter
      man_hover.lua             # Man page hover in floating window
```

No `ftplugin/`, `after/`, `snippets/`, `spell/`, `.luarc.json`, or
`.editorconfig` directories/files. Note: `AGENTS.md` says indentation is
"enforced by `.editorconfig`", but no such file exists (stylua.toml is the
enforcer). A `README.md` exists in the deployed directory only; it is not
managed by chezmoi.

---

## Core Config Files

### lazy.lua (bootstrap)

- **direnv.nvim loads first**, before LazyVim core, so plugins depending on
  direnv-provided environment can see it. Autoload on, statusline component
  enabled (`󱚟` icon), keybindings `<leader>da/dd/dr/de` (allow/deny/reload/edit),
  silent autoload notifications. A `DirenvLoaded` -> `DirChanged` autocmd
  re-checks direnv once after a directory change.
- Update checker enabled with notifications (`checker = { enabled, notify }`).
- **Raspberry Pi detection**: reads `/proc/device-tree/model`; caps install
  concurrency at 8 on a Pi, otherwise lazy.nvim default.
- UI: rounded borders, 0.8 x 0.8 size, backdrop 100.
- Install fallback colorschemes: tokyonight, habamax.
- Disabled rtp plugins: gzip, matchit, netrwPlugin, tarPlugin, tohtml, tutor,
  zipPlugin.

### options.lua

Every setting carries an explanatory comment.

| Option | Value | Note |
|---|---|---|
| mapleader | space | LazyVim default, set explicitly |
| timeoutlen | 1000 | Neovim default restored (LazyVim sets 300ms) |
| clipboard | "" | LazyVim's `unnamedplus` off; yank-only sync via autocmd |
| shiftwidth / tabstop | 4 / 4 | LazyVim defaults to 2 |
| relativenumber | true | For count-prefixed motions like 5j / 12k |
| wrap | true | Soft wrap (LazyVim defaults to nowrap) |
| showbreak | "↪ " | Wrap indicator |
| conceallevel | 0 | Show all symbols |
| updatetime | 200 | Faster CursorHold (diagnostics float) |
| sessionoptions | +localoptions | So persistence.nvim restores buffer-local opts (e.g. spelllang) |
| spelllang | en | Per-buffer changes survive restarts via localoptions |
| listchars + list | on | nbsp ␣, precedes ←, extends →, tab ¬, conceal ※, trail • |
| guicursor | per-mode | Block (n/v/c), ver25 bar (insert), hor20 (replace), themed groups |
| g.snacks_animate | false | Snacks animations feel laggy |

Also in options.lua:

- **Markdown-only autowrap**: `BufWinEnter`/`FileType` autocmd sets
  `textwidth=80` + `colorcolumn=80` in markdown buffers, clears colorcolumn
  elsewhere (colorcolumn is window-local).
- **Plugin auto-update at startup**: `VimEnter` autocmd runs
  `require("lazy").update({ show = false })` when updates exist. Lives here
  because lazy.nvim loads autocmds.lua after VimEnter has already fired.
- **Neovide block** (`vim.g.neovide`): Cmd-S save and Cmd-C/Cmd-V copy/paste
  across all modes; JetBrainsMono Nerd Font h20; refresh rate 120 (with vsync
  off in `~/.config/neovide/config.toml`); cursor travel/trail animations
  zeroed; scroll animation 0 (winbar redraw workaround); particle effects off;
  **right Option acts as meta** so alt keymaps work while left Option still
  types special characters.

### keymaps.lua (207 lines, 8 sections)

Space is explicitly mapped to `<Nop>` (n, v) to avoid leader races.

**Unmapped LazyVim defaults:** `<leader>bb`, `bo`, `bd`, `bD`, `fn`, `K`, `|`

**Kitty terminal emulation** (kitty sends escape sequences for Option keys):
- `M-b` / `M-f` word left/right (normal, visual, insert, cmdline)
- `Home` / `End` line start/end (all modes; kitty maps ⌥↑/⌥↓ to End/Home)
- `M-BS` / `M-Backspace` delete previous word (insert, cmdline)

**Buffer management:**
- `A-c` close buffer (smart: falls back to Alpha if last window)
- `A-C` force close
- `leader+bn` new file
- `leader+bA` add current dir as project
- `leader+\` split right

**External tools:**
- `leader+y` open Yazi file manager (memoized floating toggleterm)

**Editing:**
- `leader+W` save without formatting (`:noautocmd w`)
- `leader+fw` grep all files via Snacks picker (only if `rg` on PATH)

**Clipboard:**
- `C-c` copy file (normal) / selection (visual)
- `C-x` delete file (normal) / cut selection (visual)
- `Tab` / `S-Tab` indent/dedent keeping selection (visual)

**Numbers:**
- `+` increment, `=` decrement

**Quit:**
- `C-q` quit all (confirm)
- `leader+qq` quit window
- `leader+qQ` quit all

**Go:**
- `leader+ce` insert `if err != nil` block

### autocmds.lua (279 lines)

Highlight override system that applies on startup AND after every colorscheme
change (`ColorScheme` autocmd, deferred via `vim.schedule` so it runs after
the theme's own callbacks):
- Blink-cmp menu/doc: transparent backgrounds, borders linked to FloatBorder
- DAP virtual text: custom fg colors (yellow/red/violet)
- Barbar: full buffer tab color matrix (current, inactive, alternate, visible,
  each with git status, diagnostic, and file status variants)
- CursorLine / Visual colors
- Window separators (WinSeparator cleared, EdgyWinSep + NeoTree separators set)
- Neo-tree dotfile/hidden colors
- VS Code-style CMP item kind colors (Function=purple, Variable=blue,
  Class=orange, etc.) and matching Aerial icon colors
- Spell undercurl color (#ffbba6) for all four Spell groups
- LSP inlay hints: gray
- Alpha dashboard: custom header/greeting/button/shortcut/footer/quote groups

Functional autocmds:
- **TextYankPost**: copy yanks (operator `y` only) to the system clipboard;
  pairs with `clipboard=""` so deletes/changes never touch the macOS pasteboard
- Disable spell in markdown
- **Go template highlighting**: for `*.<ext>.tmpl` files, set the base
  filetype from the inner extension (sh, go, html, md, toml, yaml) and overlay
  `{{ }}` / `{% %}` regions with `syntax/gotmpl.vim`
- Mason auto-update (`MasonUpdate` + `MasonUpdateAll`) after Lazy sync

---

## LazyVim Extras (36 enabled)

### AI
- `lazyvim.plugins.extras.ai.copilot`
- `lazyvim.plugins.extras.ai.sidekick`

### Coding
- `lazyvim.plugins.extras.coding.luasnip`
- `lazyvim.plugins.extras.coding.yanky`

### DAP (Debugging)
- `lazyvim.plugins.extras.dap.core`
- `lazyvim.plugins.extras.dap.nlua`

### Editor
- `lazyvim.plugins.extras.editor.aerial`
- `lazyvim.plugins.extras.editor.illuminate`
- `lazyvim.plugins.extras.editor.inc-rename`
- `lazyvim.plugins.extras.editor.neo-tree`

### Formatting
- `lazyvim.plugins.extras.formatting.black`
- `lazyvim.plugins.extras.formatting.prettier`

### Languages (16 total)
Ansible, clangd, CMake, Docker, Git, Go, Java, JSON, Markdown, Python, SQL,
Tailwind, Terraform, TOML, TypeScript, YAML

### Testing
- `lazyvim.plugins.extras.test.core`

### UI
- `lazyvim.plugins.extras.ui.alpha`
- `lazyvim.plugins.extras.ui.edgy`
- `lazyvim.plugins.extras.ui.mini-animate`
- `lazyvim.plugins.extras.ui.treesitter-context`

### Util
- `lazyvim.plugins.extras.util.dot`
- `lazyvim.plugins.extras.util.mini-hipatterns`
- `lazyvim.plugins.extras.util.project`

---

## Plugin Inventory (95 total in lazy-lock.json)

### Actively Configured (35 spec files)

#### Theme & Visual
| Plugin | Config Summary |
|---|---|
| **solarized.nvim** | THE colorscheme: autumn variant, dark background, bold styles on nearly everything (types, functions, parameters, strings, keywords, variables, constants), italic comments, not transparent, SpellBad forced to undercurl |
| **barbecue.nvim** | VS Code-style winbar breadcrumbs via nvim-navic; default opts. Spec'd twice (barbeque.lua and colorscheme.lua), harmlessly merged by lazy.nvim |
| **lualine** | Extends LazyVim's default statusline with: mutagen project sync status (10s/1s poll, error coloring), encoding/fileformat/filetype, direnv statusline, clickable per-buffer Copilot toggle, per-language version components (Go/Node/Java/Python, shown only in matching filetypes), sorted LSP client list (click -> :LspInfo) |
| **barbar** | Tab bar with git/diagnostic icons, S-Tab/Tab nav, A-1..9 jump, A-p pin, `leader+ba/bp/bP` close-others variants, `leader+bs*` sort commands; disables bufferline.nvim |
| **alpha-nvim** | NEOVIM block header, time-based greeting ("Good morning, Pete"), fortune quotes with author attribution stripped, 10 buttons, dynamic vertical centering recomputed on WinResized, scroll fully locked (scrolloff 999 + ~20 scroll keys noop'd) |
| **statuscol** | 3 segments: DAP signs, line numbers, gitsigns; clicks: left=preview hunk, Ctrl+left/middle=reset, right=stage, DAP sign click toggles breakpoint |
| **nvim-ufo** | (in statuscol.lua) treesitter+indent folding, foldcolumn 1, foldlevel 99, custom fold virtual text with " N" line count suffix, zR/zM rebound to UFO variants |
| **mini.animate** | Open animation only (static, 25 steps), skipped for sidekick CLI windows; close animation disabled |
| **noice** | Cmdline popup (30% row), lsp_doc_border + inc_rename presets, hover enabled, signature help auto-opens (25x90 rounded, scrollbar), routes silencing img-clip "not an image", Snacks "No results found", and Mason registry/update chatter |
| **which-key** | Helix preset (spec'd in both which-key.lua and ui.lua) |
| **edgy** | Exit when last; window separators highlighted via EdgyWinSep |
| **ui.lua** | Grab-bag file: bufferline opts (dead, since barbar.lua sets `enabled = false`), duplicate which-key spec, extra noice routes ("No information available" skip, an inert focus-tracking route, markdown key handling autocmd) |

#### LSP & Completion
| Plugin | Config Summary |
|---|---|
| **nvim-lspconfig** | Custom diagnostic signs, no virtual text, underline, severity sort; all LSP nav keys rerouted (see LSP Keymap Architecture) |
| **blink.cmp** | Signature help off, no preselect, no auto-insert, list cycling both ways, rounded menu/doc borders, doc auto-show at 100ms, Tab/S-Tab + C-j/C-k selection, CR accept, Up/Down disabled; **copilot source gated per-buffer** on `vim.b.copilot_enabled` |
| **copilot.lua** | Telemetry off. Effectively opt-in per buffer: suggestions only reach blink when the lualine toggle sets `b:copilot_enabled` |
| **mason** | Rounded borders, mason-extra-cmds for :MasonUpdateAll |
| **tiny-code-action** | Snacks picker, vim diff backend, custom kind icons linked to Diagnostic* groups (buffer-picker alternative left commented) |
| **tiny-inline-diagnostic** | Modern preset, multiline always-show but messages off (`add_messages = false`), throttle 0, wrap overflow, priority 2048, transparent cursorline |
| **goto-preview** | 120x15, box-drawing border, telescope dropdown for references, q closes all previews, stacked preview windows, same-file previews, title on left |

#### Navigation & Search
| Plugin | Config Summary |
|---|---|
| **neo-tree** | Close if last window, custom expanders, Y copy-path selector (5 formats: filename/absolute/cwd-relative/home-relative/URI, restores cursor after), P float preview with snacks image support, `e` noop'd, not bound to cwd, libuv file watcher, hidden files shown dimmed, .DS_Store/thumbs.db never shown |
| **telescope** | Horizontal layout, top prompt, ascending sort; adds `leader+f/` buffer fuzzy find, `leader+fp` projects, `leader+fP` find plugin file |
| **searchbox** | `leader+s.` search/replace in current buffer |
| **yanky** | `-p`/`-P` put with filter (defaults `=p`/`=P` disabled) |
| **illuminate** | Denylist: alpha, avante, aerial, lazy, neo-tree, toggleterm, help, Trouble |

#### Code Execution & Tools
| Plugin | Config Summary |
|---|---|
| **code-runner** | Toggleterm mode, 15 filetypes (c, cpp, rust, java, zig, python, js, ts, ruby, lua, sh, bash, zsh, go, kotlin), `leader+r*` which-key group, `leader+ra` interactive compile-flags/runtime-args runner, project configs in projects.json |
| **toggleterm** | Floating; A-z toggles from normal mode, and in terminal mode exits terminal mode then closes all terminals |
| **codesnap** | CaskaydiaCove font, breadcrumbs on, ~/Downloads output, clipboard (`leader+cpc`) and file (`leader+cps`) modes |
| **markdown-preview** | Dark theme, `leader+cp` in markdown buffers |
| **vivify** | Second markdown previewer (external Vivify viewer); also sets `g:markdown_fenced_languages` for fenced code highlighting |
| **ts-comments** | Comment.nvim is DISABLED (nil commentstring crash on Neovim 0.12); native gc + ts-comments instead, with `leader+/` toggle (n and visual) |
| **guess-indent** | 10 excluded filetypes, editorconfig respected |
| **nvim-lint** | markdownlint-cli2 with `~/.markdownlint-cli2.yaml` config |

#### AI (mostly disabled)
| Plugin | Config Summary |
|---|---|
| **sidekick** | A-a toggles CLI (attaches to running session, else opens **opencode**), A-Tab NES jump/apply, Tab unbound, float layout 90%x85%, tmux mux configured but **disabled** |
| **avante** | DISABLED; configured for Claude Sonnet 4 + Moonshot Kimi-K2, snacks selector/input |
| **opencode-nvim** | DISABLED (sudo-tee/opencode.nvim with full `leader+o*` keymap tree) |
| **opencode-terminal** | DISABLED (NickvanDyke/opencode.nvim variant) |

### LazyVim-Managed Plugins (from extras, not custom-configured)

aerial.nvim, blink-copilot, bufferline.nvim (disabled by barbar.lua),
catppuccin + tokyonight.nvim (locked/installed but referenced by no spec;
tokyonight is the install-time fallback), clangd_extensions.nvim,
cmake-tools.nvim, Comment.nvim (locked but disabled), conform.nvim,
flash.nvim, fortune.nvim, friendly-snippets, gitsigns.nvim (custom
preview_config: minimal rounded float at cursor), grug-far.nvim,
inc-rename.nvim, lazydev.nvim, logger.nvim, LuaSnip, mason-lspconfig.nvim,
mason-nvim-dap.nvim, mini.ai, mini.hipatterns, mini.icons, mini.pairs,
neotest + neotest-golang + neotest-python, nui.nvim, nvim-ansible,
nvim-dap + dap-go + dap-python + dap-ui + dap-virtual-text, nvim-jdtls,
nvim-navic (via barbecue), nvim-nio, nvim-treesitter + context + textobjects,
nvim-ts-autotag, nvim-web-devicons, one-small-step-for-vimkind,
persistence.nvim, plenary.nvim, project.nvim, promise-async,
render-markdown.nvim, SchemaStore.nvim, snacks.nvim (statuscolumn disabled),
telescope-terraform.nvim + telescope-terraform-doc.nvim, todo-comments.nvim,
trouble.nvim, uv.nvim (via python extra), vim-dadbod + completion + ui,
venv-selector.nvim

---

## Utility Modules

### close_or_alpha.lua
Smart buffer close used by A-c / A-C. If other windows show normal file
buffers, just delete the buffer. If this is the last normal window, switch to
the next listed file buffer first; when none remains, open the Alpha dashboard
(fallback `:enew`) before deleting. All deletions wrapped in pcall; supports
force close.

### go_iferr.lua
Inserts Go `if err != nil` blocks at the cursor byte offset. Auto-installs the
`iferr` binary via `go install github.com/koron/iferr@latest` on first use.
Strips ANSI codes, auto-indents, honors `g:go_iferr_vertical_shift`. Bound to
`leader+ce`.

### man_hover.lua
Opens the man page for the word under the cursor in a rounded floating window
(via `vim.lsp.util.open_floating_preview`, max height 25). `q` closes and
returns focus to the source window. Bound to `gm`.

---

## LSP Keymap Architecture

LazyVim's default LSP navigation is unmapped via `opts.servers["*"].keys` and
replaced with goto-preview floating windows:

| Key | Action | Plugin |
|---|---|---|
| `gd` | Definition preview | goto-preview |
| `gr` | References preview | goto-preview + telescope dropdown |
| `gI` | Implementation preview | goto-preview |
| `gy` | Type definition preview | goto-preview |
| `gD` | Declaration preview | goto-preview |
| `gh` | Hover documentation | Native LSP |
| `gm` | Man page hover | Custom util |
| `gP` | Close all previews | goto-preview |
| `leader+ca` | Code action (n, v) | tiny-code-action |
| `leader+cA` | Source action | tiny-code-action |

---

## Design Patterns

1. **Modular plugin organization**: one file per plugin in lua/plugins/
   (with ui.lua and colorscheme.lua as multi-plugin exceptions)
2. **Environment-first bootstrap**: direnv.nvim loads before every other
   plugin so the rest of the config sees direnv-managed env vars
3. **LazyVim extras for language support**: 16 language packs
4. **goto-preview pattern**: all LSP navigation in floating preview windows
   instead of quickfix or splits
5. **Theme-agnostic highlight system**: ~100 highlight groups reapplied via
   autocmd after every colorscheme change
6. **Per-buffer opt-in Copilot**: completions off by default; a lualine click
   toggles `b:copilot_enabled`, which gates the blink source
7. **Yank-only clipboard**: `clipboard=""` plus a TextYankPost autocmd keeps
   deletes/changes out of the macOS pasteboard
8. **Disabled-plugin convention**: `if true then return {} end` at the top of
   a spec file keeps the config on disk without loading it
9. **Smart close pattern**: buffer close falls back to the Alpha dashboard
10. **Kitty terminal emulation**: Alt-key word motions replicated in all
    modes, mirrored by Neovide's right-Option-as-meta setting
11. **GUI parity**: a dedicated Neovide block reproduces terminal behavior
    (fonts, meta key, clipboard) and disables animations
12. **Chezmoi-managed source**: the config is a subtree of the dotfiles repo;
    machine-local state (lazy-lock.json) stays out of source control

---

## Plugin Documentation Cross-Reference

Options and capabilities worth knowing, checked against plugin docs and
current settings.

### Theme & Visual Plugins

#### solarized.nvim
- 4 variants: `spring`, `summer`, `autumn` (yours), `winter`.
- Supports `transparent.enabled` plus granular per-UI-element transparency
  (normal, normalfloat, neotree, telescope, lualine, etc.); you keep it off.
- `on_highlights(colors, color)` callback used here to force SpellBad to
  undercurl; `on_colors` exists for palette-level overrides.
- `plugins` table toggles per-plugin integrations; you disable only `lualine`.
- Styles accept full `nvim_set_hl` attribute tables; you bold nearly all
  syntax classes, which is a distinctive look on solarized's muted palette.

#### barbecue.nvim
- Winbar breadcrumbs: project dirname, basename, and nvim-navic context.
- Requires nvim-navic; LSP servers must support documentSymbol.
- Useful unused options: `show_modified` (default false), `theme` (auto-derives
  from colorscheme, has a solarized entry in most theme packs),
  `exclude_filetypes`, `attach_navic = false` if another plugin owns navic.
- `create_autocmd = false` + custom updater is the documented way to throttle
  updates if the winbar ever feels slow.

#### lualine
- You extend LazyVim's default sections rather than defining a full theme;
  a solarized lualine theme ships with lualine (`theme = "solarized_dark"`)
  if the auto theme ever mismatches.
- The mutagen component shells out at most every 1-10s per cwd and caches per
  directory; it notifies loudly when a `mutagen.yml` project has no sessions.
- Version components (`go version`, `node -v`, `java -version`,
  `python --version`) run `io.popen` on every statusline refresh in matching
  filetypes; caching their output would cut repeated subprocess spawns.
- `globalstatus` and 16ms `refresh` remain available but unset.

#### barbar
- 3 icon presets: `default`, `powerline`, `slanted`.
- `auto_hide = N` hides the tabline with N or fewer buffers (you keep false).
- `focus_on_close`: `"left"` / `"previous"` / `"right"`.
- `semantic_letters` for smart buffer-letter assignment.
- Your icon config covers all states (current, inactive, alternate, visible);
  colors come from the autocmds.lua highlight matrix.

#### alpha-nvim
- 4 section types: `text`, `button`, `padding`, `group`; also `terminal`.
- Fires `User AlphaReady` and `User AlphaClosed` (you hook AlphaReady twice:
  scroll lock + lazy.nvim window restore).
- Your `center_layout()` recomputes top padding from rendered section heights
  and re-runs on WinResized and LazyVimStarted; this is the recommended
  approach for dynamic centering.

#### statuscol + nvim-ufo
- Segments support text/sign elements with namespace or name patterns; your
  DAP and gitsigns segments pin `maxwidth/colwidth = 1` for a stable gutter.
- Click args include `button`, `mods`, `mousepos.line`; your `at_line` helper
  temporarily moves the cursor so gitsigns acts on the clicked line.
- UFO: `provider_selector` returning `{ "treesitter", "indent" }` is the
  recommended non-LSP chain; `zR`/`zM` must be rebound (you do) because UFO
  bypasses native fold levels.

#### mini.animate
- 5 animation types: cursor, scroll, resize, open, close; you enable open only.
- Window config generators: `static` (yours), `center`, `wipe`.
- Returning `{}` from `winconfig` to skip a window (your sidekick guard) is
  the documented escape hatch.
- Note `vim.g.snacks_animate = false` in options.lua also disables Snacks'
  own animation layer, so mini.animate is the single animation source.

#### noice
- 6 presets; you use `lsp_doc_border` and `inc_rename`.
- Signature `auto_open` triggers on `(`/`,` via LSP trigger characters; your
  25-line/90-col cap keeps it from covering code.
- Route filters use Lua patterns via `find`; your Mason route uses `any` with
  anchored patterns, the tidiest form for multi-message silencing.
- ui.lua adds a focus-tracked `notify_send` route whose `cond` ends in
  `and false`, so it never fires (dead config, presumably an experiment).

#### which-key
- 3 presets: `classic`, `modern`, `helix` (yours: compact bottom-right).
- Two identical specs (which-key.lua, ui.lua) merge cleanly; the ui.lua copy
  adds a `debug` flag that only activates when cwd matches "which-key".
- Plugin keymap groups are registered ad hoc via `pcall(require, "which-key")`
  inside each plugin's init/config, a consistent pattern across the config.

#### edgy
- 4 edge positions with size defaults; you only set `exit_when_last` and the
  separator highlight.
- Built-in keymaps: `q` close, `C-q` hide, `Q` close sidebar, `]w`/`[w` nav.

### LSP & Completion Plugins

#### blink.cmp
- Built-in sources: lsp, buffer, snippets, path, omni; copilot comes from
  blink-copilot via the LazyVim extra.
- 4 keymap presets: `default`, `super-tab`, `enter`, `none` (yours).
- Your per-buffer copilot gate uses the provider-level `enabled` function,
  which is evaluated per completion request, exactly what a runtime toggle
  needs.
- Ghost text (`completion.ghost_text.enabled`) is off; with preselect and
  auto_insert both false, completion is fully manual until Tab/CR.
- Per-filetype source overrides via `sources.per_filetype` available.

#### copilot.lua
- Telemetry disabled via `server_opts_overrides.settings.telemetry`.
- NES (next edit suggestions) is consumed through sidekick.nvim rather than
  copilot.lua's own experimental support.
- `workspace_folders` and `should_attach` exist for finer control; the
  lualine toggle covers the same need at the buffer level.

#### nvim-lspconfig
- Nvim 0.11+ `vim.lsp.config()` / `vim.lsp.enable()` pattern is what LazyVim
  drives; your `servers["*"].keys` override is the LazyVim-native way to
  replace LSP keymaps for every server.
- `virtual_lines` is the built-in alternative to tiny-inline-diagnostic if
  you ever drop the plugin.

#### mason + mason-lspconfig
- `automatic_enable` auto-starts installed servers.
- mason-extra-cmds adds `:MasonUpdateAll`, which your LazySync autocmd calls;
  update chatter is silenced by the noice route.
- Version pinning with `@` syntax in `ensure_installed` available.

#### tiny-code-action
- 4 diff backends: `vim` (yours, fastest), `delta`, `difftastic`,
  `diffsofancy`.
- 5 pickers: `telescope`, `snacks` (yours), `select`, `buffer`, `fzf-lua`;
  a fully-worked `buffer` picker config is kept commented in the spec.
- Your custom `signs` table maps action kinds (including dotted kinds like
  `refactor.extract` and `source.fixAll`) to icons + Diagnostic highlights.

#### tiny-inline-diagnostic
- 8 presets: `modern` (yours), `classic`, `minimal`, `powerline`, `ghost`,
  `simple`, `nonerdfont`, `amongus`.
- You run multiline with `always_show` but `add_messages = false`: signs
  appear on every affected line, message text only under the cursor.
- `throttle = 0` favors visual feedback over redraw cost.
- LazyVim's own virtual text stays off via lsp-config.lua, avoiding overlap.

#### goto-preview
- 5 preview types, all bound; references use the telescope dropdown theme.
- `stack_floating_preview_windows = true` allows chained gd inside previews;
  `gP`/q unwinds the whole stack.
- `same_file_float_preview = true` previews even within the current file.
- `vim_ui_input = true` integrates rename prompts inside preview windows.

### Navigation & Search Plugins

#### neo-tree
- 50+ event handlers available for lifecycle hooks.
- Your `copy_selector` command implements the documented custom-command
  pattern, plus cursor restoration that the stock example lacks.
- `use_libuv_file_watcher = true` keeps the tree in sync without autocmds.
- `bind_to_cwd = false` decouples the tree root from `:cd` (relevant since
  direnv can trigger DirChanged).
- P preview uses `use_snacks_image` for inline image rendering.

#### telescope
- 6 layout strategies; yours horizontal with top prompt + ascending sort so
  results read downward from the prompt.
- `telescope-fzf-native.nvim` (compiled C sorter) is the most impactful
  missing performance add-on.
- Terraform doc pickers come from the terraform extra.

#### searchbox
- 5 search modes; `replace` used here.
- `confirm` option supports `"menu"` for per-match action lists.
- Modifier options (case sensitivity, magic) and mount hooks available.

#### yanky
- Storage backends: shada (default), sqlite, memory.
- `Snacks.picker.yanky()` provides ring history picking without extra config.
- `sync_with_numbered_registers` and `system_clipboard.sync_with_ring`
  available; note interaction with your `clipboard=""` choice if enabled.

#### vim-illuminate
- 3 providers in priority order: lsp, treesitter, regex.
- `large_file_cutoff` (default 10000 lines) worth setting for giant files.
- Highlights via `IlluminatedWord{Text,Read,Write}` groups.

### Code Execution & Tools

#### toggleterm
- 4 directions: horizontal, vertical, float (yours), tab.
- `Terminal:new()` API powers both the memoized Yazi terminal (keymaps.lua)
  and code_runner's output.
- Your terminal-mode A-z first leaves terminal mode via feedkeys, then
  `ToggleTermToggleAll`, so multiple runners close together.

#### code_runner
- 6 run modes; toggleterm (yours) plus per-invocation overrides via the
  `leader+rm*` group (term/float/tab/toggleterm/buf).
- Variables: `$file`, `$fileName`, `$fileNameWithoutExt`, `$dir`, `$end`.
- Your `leader+ra` flow wraps `run_from_fn` with vim.ui.input prompts for
  compiler flags and runtime args, with per-language defaults.
- Project config (projects.json): Dockitect -> `pnpm run dev`.

#### codesnap
- Output formats: png (yours via save_path), svg, html.
- `CodeSnapHighlight` and ASCII-art `CodeSnapASCII` variants available.
- Breadcrumbs on with `/` separator; transparent padding (bg_padding 0).

#### markdown-preview + vivify
- Two previewers coexist: markdown-preview.nvim (browser, dark theme,
  KaTeX/Mermaid/PlantUML support, `leader+cp`) and vivify.vim (uses the
  external Vivify viewer app, live-follows cursor, no keymap here, `:Vivify`).
- vivify.lua also sets `g:markdown_fenced_languages`, which improves fenced
  block highlighting in the legacy regex syntax path (treesitter mostly
  supersedes it, but it costs nothing).

#### guess-indent
- Sub-1ms detection, no tuning params; respects .editorconfig by default
  (`override_editorconfig = false`), though the repo has none.
- `:GuessIndent` for manual trigger.

#### nvim-lint
- 200+ built-in linters; you customize only markdownlint-cli2's args to point
  at `~/.markdownlint-cli2.yaml`.
- Linter definitions accept function forms for dynamic configuration.

### AI Plugins

#### sidekick.nvim
- Two subsystems: NES (Copilot LSP next-edit suggestions) and CLI (floating
  terminal for AI tools: aider, claude, codex, copilot, gemini, grok,
  opencode, and more).
- Your A-a binding is session-aware: reattaches to any running CLI session,
  otherwise starts opencode focused.
- `cli.mux` (tmux/zellij persistence) configured for tmux but disabled.
- `stopinsert = false` keeps the CLI in terminal-insert mode.
- Per-buffer NES kill switch: `vim.b.sidekick_nes = false`.

#### direnv.nvim
- Options in use: autoload, statusline icon, allow/deny/reload/edit keymaps
  (`leader+d*`), silent autoload at INFO level.
- The custom DirenvLoaded -> DirChanged chain re-checks direnv exactly once
  after the first directory change; `check_direnv()` is the manual API.
- Loading it as the first spec (before LazyVim core) is unusual and
  deliberate: plugin `config()` functions that shell out inherit the
  direnv-managed environment.

### LazyVim-Managed Plugins (docs summary)

#### gitsigns.nvim
- Your only override is `preview_config` (minimal, rounded, cursor-relative),
  which styles the float that statuscol's left-click opens.
- Stage/reset/preview hunk actions are driven from statuscol clicks; the
  `leader+gh*` LazyVim defaults remain too.

#### nvim-treesitter + context
- Main branch requires Neovim 0.12+ (satisfied).
- Context window options (`max_lines`, `mode`, `separator`) unconfigured.

#### aerial.nvim
- Backends: treesitter, lsp, markdown; icon colors come from the autocmds.lua
  VS Code-style Aerial* groups.

#### flash.nvim
- Stock LazyVim config; `s`/`S` motions, treesitter search available.

#### conform.nvim
- Formatting via LazyVim defaults plus black/prettier extras; `leader+W`
  (noautocmd write) is the escape hatch to skip format-on-save.

#### trouble.nvim
- The lualine diagnostics click handler prefers Trouble v3's Lua API, falls
  back to :Trouble/:TroubleToggle commands, then telescope, then the quickfix
  list.

#### neotest + adapters
- neotest-golang and neotest-python from extras; runner options
  (gotestsum, pytest discovery) unconfigured.

#### persistence.nvim
- Works with your extended `sessionoptions` (+localoptions), so buffer-local
  spelling settings survive session restores; Alpha's `s` button restores.

#### project.nvim
- `:AddProject` bound to `leader+bA`; telescope projects picker on
  `leader+fp`.

#### snacks.nvim
- statuscolumn disabled in favor of statuscol.nvim; animations disabled via
  `g.snacks_animate`.
- bigfile and quickfile are enabled by LazyVim v16 defaults.
- Snacks picker is the front-end for grep (`leader+fw`), tiny-code-action,
  and yanky.

#### uv.nvim
- Comes with the python extra: uv-based environment and script running for
  Python; complements venv-selector.

---

## Framework Analysis

### Duplications and dead config worth cleaning up

- **barbecue.nvim is spec'd twice**: identical blocks in `barbeque.lua` and
  `colorscheme.lua`. lazy.nvim merges them, but one should go (and the
  filename `barbeque.lua` vs plugin name "barbecue" invites grep misses).
- **ui.lua bufferline opts are dead**: `barbar.lua` sets
  `{ "akinsho/bufferline.nvim", enabled = false }`, so the
  `separator_style = "slope"` opts in ui.lua never apply.
- **ui.lua duplicates the which-key spec** (same helix preset as
  which-key.lua) and carries an inert noice route (`cond` ends in
  `and false`).
- **catppuccin and tokyonight are installed but unused**: locked in
  lazy-lock.json with no spec referencing them; tokyonight appears only as
  the `install.colorscheme` fallback in lazy.lua. Removable if solarized is
  permanent.
- **autocmds.lua highlight hexes don't match the colorscheme**: the barbar
  matrix and CursorLine/Visual colors use a catppuccin-mocha-style palette
  layered over solarized autumn. They work, but an `on_highlights` pass using
  solarized's own palette would unify the look.
- **AGENTS.md references `.editorconfig`**, which does not exist.
- **Two markdown previewers** (markdown-preview.nvim and vivify.vim) overlap;
  only markdown-preview has a keymap.
- **avante.lua, opencode-nvim.lua, opencode-terminal.lua** are disabled specs
  kept on disk; sidekick owns the AI-CLI role. Candidates for deletion if
  they are not coming back.

### LazyVim extras not enabled (notable candidates)

- `ai.claudecode`: direct Claude Code integration in Neovim
- `coding.mini-surround`: no surround plugin is currently installed
- `editor.dial`: enhanced increment/decrement (would complement the `+`/`=`
  maps with dates, booleans, semver)
- `editor.harpoon2`: quick file bookmarks
- `editor.overseer`: task runner (overlaps code-runner; could replace it)
- `linting.eslint`: ESLint diagnostics to pair with the TypeScript extra
- `util.startuptime`: startup profiling, useful with 36 extras + 95 plugins
- `util.octo`: GitHub PR review in Neovim

### snacks.nvim modules not enabled

- `words`: LSP reference highlights + `]]`/`[[` navigation (would overlap
  illuminate; pick one)
- `scope`: scope-aware text objects and jump-to-scope-boundary
- (`bigfile` and `quickfile` are on by default in LazyVim v16)

### lazy.nvim notes

- `git.throttle` exists for the Raspberry Pi case, complementing the custom
  concurrency cap.
- Startup does both a `checker` pass and an unconditional
  `require("lazy").update()` on VimEnter; the checker's notify is arguably
  redundant given auto-update, and auto-update on every launch trades
  reproducibility for freshness (lazy-lock.json changes silently).

---

## Architecture Summary

This is a highly integrated Neovim setup with 95 locked plugins across 36
LazyVim extras, organized around these pillars:

1. **Floating preview paradigm**: LSP navigation, code actions, man pages,
   diagnostics, terminals, and the AI CLI all render in floating windows
   rather than quickfix lists or splits.

2. **Theme-agnostic highlight system**: ~100 highlight groups reapplied after
   every colorscheme change, layering VS Code-ish completion colors and a
   custom barbar palette over solarized autumn.

3. **Environment-aware bootstrap**: direnv.nvim loads before all other
   plugins, its status lives in lualine, and Raspberry Pi hardware is
   detected to tune install concurrency.

4. **Multi-language workstation**: 16 language packs covering systems
   (C/C++/Go), web (TypeScript/Tailwind), infrastructure
   (Docker/Terraform/Ansible/YAML/CMake), data (Python/SQL), and JVM (Java),
   with per-language version readouts in the statusline.

5. **Deliberately restrained AI**: Copilot completions are opt-in per buffer
   via a statusline toggle; sidekick's A-a fronts an opencode CLI session;
   avante and two opencode plugins are kept on disk but disabled.

6. **Clipboard discipline**: yanks reach the macOS pasteboard, deletes and
   changes never do.

7. **Smart buffer lifecycle**: custom close logic keeps the Alpha dashboard
   as the terminal state, preventing empty Neovim sessions.

8. **Click-driven status column**: gitsigns preview/stage/reset, DAP
   breakpoint toggles, and UFO fold controls all accessible from the gutter.

9. **Terminal/GUI parity**: kitty escape-sequence keymaps and a Neovide
   settings block converge on identical Alt-key and clipboard behavior.
