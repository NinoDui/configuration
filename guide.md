# Vim ML Engineer Guide

Quick reference for this vimrc setup. Covers navigation, code intelligence, REPL workflow, and language-specific tools.

---

## Navigation

| Key | Action |
|-----|--------|
| `Ctrl+\` | Toggle NERDTree file browser (opens on the right) |
| `F3` | Open CtrlP fuzzy file finder |
| `F2` | Toggle Tagbar — shows classes, functions, symbols in current file |
| `Ctrl+]` | Jump to tag definition (requires ctags) |
| `Ctrl+o` / `Ctrl+i` | Jump back / forward through cursor positions |

**NERDTree tips:**
- Opens automatically when you run `vim` with no file
- Closes automatically when it's the last window
- `m` inside NERDTree opens a menu to create, rename, delete files
- Ignores `.git`, `.pyc`, `node_modules`, `.swp` automatically
- Git status icons shown next to files (nerdtree-git-plugin)

**CtrlP tips:**
- `Ctrl+t` inside CtrlP to open in new tab
- `Ctrl+v` to open in vertical split
- Type part of a path, not just filename: `models/train` narrows faster

---

## Code Intelligence (coc.nvim)

| Key | Action |
|-----|--------|
| `Tab` / `Shift+Tab` | Next / previous completion item |
| `Enter` | Confirm completion |
| `Ctrl+Space` | Manually trigger completion |
| `gd` | Go to definition |
| `gr` | Find all references |
| `K` | Show hover docs / type signature |
| `<leader>rn` | Rename symbol across project |

**Install language servers once:**
```
:CocInstall coc-pyright coc-clangd
```

**Useful coc commands:**
```
:CocList diagnostics    — all errors/warnings in project
:CocList symbols        — jump to any symbol in workspace
:CocInfo                — debug coc status if completions stop working
```

---

## Linting (Syntastic)

Syntastic is set to **passive mode** — it does not run on save by default, which avoids slowdowns on large files.

| Key | Action |
|-----|--------|
| `Ctrl+p` | Toggle Syntastic + run check now |
| `:lopen` | Open location list of errors |
| `:lclose` | Close location list |
| `:lnext` / `:lprev` | Jump between errors |

Suppressed noise: `invalid-name`, `too-many-lines`, `too-many-locals`, `too-many-branches`, `too-many-instance-attributes` — intentionally ignored since ML code regularly violates these.

---

## Python Workflow

| Key | Action |
|-----|--------|
| `Ctrl+k` | Auto-format buffer with autopep8 (max line 100) |
| `za` | Toggle fold on a class or function (SimpylFold) |
| `zM` / `zR` | Fold all / unfold all |

A vertical red line appears at column 100 as a line-length guide.

**REPL workflow with vim-slime:**

vim-slime sends text from Vim to a running terminal multiplexer (tmux or screen).

1. Start a tmux session with a Python/Julia/IPython REPL in one pane
2. Open your script in Vim in another pane
3. Configure on first use (`:SlimeConfig`) — set target to your tmux pane
4. Send code:

| Key | Action |
|-----|--------|
| `Ctrl+c Ctrl+c` | Send current paragraph / visual selection to REPL |
| `Ctrl+c v` | Reconfigure slime target pane |

**Typical ML iteration loop:**
```
1. Write a function or cell block in Vim
2. Ctrl+c Ctrl+c  →  executes in IPython/Julia REPL
3. Inspect output in REPL pane
4. Edit, repeat
```

No need to leave Vim or restart a kernel.

---

## Julia Workflow

| Key | Action |
|-----|--------|
| `Tab` (insert mode) | Convert LaTeX shorthand to Unicode (e.g. `\alpha` → `α`) |

`latex_to_unicode_auto` is off — Unicode substitution only fires on `Tab`, not automatically while typing. This avoids surprises mid-word.

Send Julia code to a running `julia` REPL via vim-slime the same way as Python above.

---

## C++ Workflow

| Key | Action |
|-----|--------|
| `Ctrl+k` | Format buffer with clang-format (Google style, indent 4, max 100) |

---

## Git (vim-fugitive)

| Command | Action |
|---------|--------|
| `:Git` | Interactive git status — stage hunks with `s`, commit with `cc` |
| `:Git diff` | Diff of working tree |
| `:Git blame` | Inline blame for current file |
| `:Git log` | Log browser |
| `:Gread` | Revert current file to HEAD (in buffer, not on disk yet) |
| `:Gwrite` | Stage current file |

---

## Session Management (vim-obsession)

| Command | Action |
|---------|--------|
| `:Obsess` | Start recording session to `Session.vim` |
| `:Obsess session_name.vim` | Record to a named file |
| `vim -S Session.vim` | Restore session from shell |
| `:Obsess!` | Stop recording and delete session file |

Good practice: run `:Obsess` when opening a project. Saves open buffers, splits, and window layout. Works well with tmux-resurrect to survive reboots.

---

## Focus Mode (Goyo + Limelight)

| Command | Action |
|---------|--------|
| `:Goyo` | Toggle distraction-free mode (centered, no statusline) |
| `:Limelight` | Dim all paragraphs except current one |
| `:Limelight!` | Turn off Limelight |

Useful when writing docstrings, READMEs, or research notes in Markdown.

---

## Markdown & LaTeX

- `:InstantMarkdownPreview` — live Markdown preview in browser (slow mode on, so it doesn't re-render on every keystroke)
- `:LLPStartPreview` — live LaTeX preview compiled with XeLaTeX

---

## Window & Buffer Management

| Key / Command | Action |
|---------------|--------|
| `Ctrl+w v` | Vertical split |
| `Ctrl+w s` | Horizontal split |
| `Ctrl+w h/j/k/l` | Move between splits |
| `Ctrl+w =` | Equalize split sizes |
| `:bn` / `:bp` | Next / previous buffer |
| `:bd` | Close buffer |
| `:ls` | List open buffers |

The airline statusline shows the current buffer number (`BN: N`) and the current date/time.

---

## Appearance

| Command | Action |
|---------|--------|
| `F5` (GUI only) | Toggle Solarized light/dark |

Terminal Vim uses Dracula. GUI Vim uses Solarized and switches automatically: dark after 21:00 and before 09:00, light otherwise.

---

## Quick Recipes

**Open a project:**
```bash
vim .                     # opens NERDTree at current dir
vim -S Session.vim        # restore last session
```

**Explore a codebase:**
```
F3           → fuzzy find any file
F2           → see all symbols in current file
gd           → jump to definition of symbol under cursor
gr           → find all callers of a function
K            → check type/signature without leaving cursor
```

**Review training run code:**
```
za           → fold a class to see structure
zR           → unfold everything
Ctrl+p       → lint check before committing
:Git         → stage and commit from inside Vim
```

**Iterate on a model in REPL:**
```
1. vim train.py  (+ tmux pane with ipython)
2. Ctrl+c Ctrl+c → send block to IPython
3. Edit hyperparameters, resend
4. :Obsess       → save session before closing
```
