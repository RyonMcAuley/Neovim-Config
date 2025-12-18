# Neovim Configuration

```text
neovim-config
─────────────
intentional • modular • boring (in a good way)
```

A personal Neovim configuration focused on **clarity, maintainability, and fast startup**. This is not a framework or distribution. It’s a set of deliberate defaults that stays out of the way.

## Goals

* Predictable behavior
* Small, composable modules
* Minimal magic
* Easy to debug when something breaks

## Structure

```text
nvim/
├─ init.lua
├─ lua/
│  ├─ config/        # options, keymaps, autocmds
│  ├─ plugins/     # plugin specs (lazy.nvim)
│  ├─ lsp/         # language server config
│  └─ snippets/       # custom code snippets
```

## Plugin Management

* Uses **lazy.nvim**
* Plugins are declared in small, purpose-specific files
* Shared plugin definitions live in a common module

No global plugin soup. Each file owns its responsibility.

## Language Support

* LSP-first setup
* Explicit server configuration
* Minimal abstractions on top of Neovim’s native APIs

Configured languages evolve as needed rather than being preloaded.

## Philosophy

```text
- Defaults should make sense
- Config should read top-to-bottom
- If it’s hard to explain, it’s probably unnecessary
```

## Status

* Actively used
* Changes happen incrementally
* Breaking changes are intentional

## Notes

This repo exists primarily for my own workflow, but it’s public so others can borrow ideas without adopting the whole thing.
