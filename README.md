# Neovim Config

**Modern Neovim IDE • Native LSP • Neovim 0.11+**  
A clean, minimal Neovim configuration focused on correctness, speed, and long-term stability.

<p align="center">
  Built with native Neovim APIs · No deprecated frameworks · Easy to understand
</p>

---

## About

| Feature | Description |
|--------|-------------|
| Neovim Version | 0.11+ |
| LSP | Native (vim.lsp.config) |
| UI | Rose Pine |
| Philosophy | Explicit, debuggable, minimal |

---

## Supported Languages

| Language |
|---------|
| Lua |
| Python |
| C / C++ |
| JavaScript / TypeScript / TSX |
| Tailwind CSS |

---

## Installation

| Step | Command |
|------|--------|
| Backup existing config | mv ~/.config/nvim ~/.config/nvim.backup |
| Clone repository | git clone https://github.com/<your-username>/<repo-name>.git ~/.config/nvim |
| Start Neovim | nvim |

On first launch, plugins are installed automatically using lazy.nvim. Restart Neovim once setup completes.

---

## Directory Structure

~/.config/nvim
├── init.lua
└── lua
    ├── core
    │   ├── options.lua
    │   └── keymaps.lua
    └── plugins
        ├── colorscheme.lua
        ├── lualine.lua
        ├── telescope.lua
        ├── neo-tree.lua
        ├── dashboard.lua
        ├── lsp.lua
        ├── completion.lua
        ├── none-ls.lua
        └── mason.lua

---

## Key Bindings

Leader key: Space

### Navigation

| Key | Action |
|----|-------|
| <leader>e | Toggle file explorer |
| <leader>ff | Find files |
| <leader>fg | Live grep |
| <leader>fb | Buffers |
| <leader>fh | Help |

### LSP

| Key | Action |
|----|-------|
| gd | Go to definition |
| gr | References |
| K | Hover documentation |
| <leader>rn | Rename symbol |
| <leader>ca | Code actions |
| <leader>f | Format file |

### Completion

| Key | Action |
|----|-------|
| Ctrl+Space | Trigger completion |
| Enter | Confirm completion |
| Tab / Shift+Tab | Navigate items or snippets |

---

## Formatting

| Language | Tool |
|---------|------|
| Lua | stylua |
| Python | black, isort |
| JS / TS / CSS / HTML | prettierd |

Format the current file with: <leader>f

---

## TypeScript / React

| Requirement | Notes |
|------------|------|
| react | Required for TSX |
| react-dom | Required for TSX |
| @types/react | Type definitions |
| @types/react-dom | Type definitions |
| tsconfig.json | JSX must be enabled |

---

## Philosophy

| Principle |
|----------|
| Native Neovim APIs only |
| No deprecated frameworks |
| Explicit over implicit |
| Predictable and maintainable |

Built to stay stable across Neovim updates.

---

## License

MIT
"""
