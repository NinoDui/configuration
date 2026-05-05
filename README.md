# configuration
Configuration of daily development environments

## Zellij (`config_zellij.kdl`)

Terminal multiplexer config. Copy to `~/.config/zellij/config.kdl`.

**Key choices:**
- All keybinds are defined from scratch (`clear-defaults=true`) with vi-style navigation (`h/j/k/l`) across every mode
- `Ctrl+B` enters tmux-compatible mode for muscle-memory compatibility
- Mode entry shortcuts: `Ctrl+P` → pane, `Ctrl+T` → tab, `Ctrl+N` → resize, `Ctrl+H` → move, `Ctrl+O` → session, `Ctrl+S` → scroll
- `simplified_ui true` — no powerline/nerd-font glyphs required
- `theme "catppuccin-mocha"` — dark theme
- `default_layout "compact"` — compact status bar, no pane frames (`pane_frames false`)
- `copy_on_select true` — selection copies automatically
- `scrollback_lines 5000` — scrollback buffer size
- `show_startup_tips false` — no startup noise
- `web_client { font "consolas" }` — font for browser-based web client

## Ghostty (`ghostty_config`)

Terminal emulator config. Copy to `~/.config/ghostty/config`.

**Key choices:**
- `font-family = "consolas"` / `font-size = 14` — consistent font with zellij web client
- `theme = Catppuccin Macchiato` — dark theme (lighter variant than zellij's mocha)
- `term = xterm-256color` — broad compatibility over ghostty-specific terminfo
- `fullscreen = true` — starts maximized
- `confirm-close-surface = false` — close without confirmation dialog
- `scrollback-limit = 1000` — kept low; zellij handles scrollback internally
- `keybind = ctrl+p=unbind` / `keybind = ctrl+t=unbind` — freed so zellij can use them
