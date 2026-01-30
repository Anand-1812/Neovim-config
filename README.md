# Neovim Config

**Modern Neovim IDE • Native LSP • Neovim 0.11+** A clean, minimal Neovim configuration focused on correctness, speed, and long-term stability.

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

- Lua
- Python
- C / C++
- JavaScript / TypeScript / TSX
- Tailwind CSS

---

## Installation

| Step | Command |
|------|--------|
| **1. Backup** | `mv ~/.config/nvim ~/.config/nvim.backup` |
| **2. Clone** | `git clone "https://github.com/<your-username>/<repo-name>.git" ~/.config/nvim` |
| **3. Start** | `nvim` |

> **Note:** On first launch, plugins are installed automatically using `lazy.nvim`. Restart Neovim once setup completes.

---

## Directory Structure

```text
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
```

---

## Key Bindings

**Leader key:** `Space`

### Navigation

- `<leader>e` — Toggle file explorer
- `<leader>ff` — Find files
- `<leader>fg` — Live grep (search text)
- `<leader>fb` — Find buffers
- `<leader>fh` — Help tags

### LSP (Language Server)

- `gd` — Go to definition
- `gr` — Find references
- `K` — Hover documentation
- `<leader>rn` — Rename symbol
- `<leader>ca` — Code actions
- `<leader>f` — Format file

### Completion

- `Ctrl + Space` — Trigger completion manually
- `Enter` — Confirm selection
- `Tab` — Select next item
- `Shift + Tab` — Select previous item

---

## Formatting

Format the current file with `<leader>f`.

- **Lua:** `stylua`
- **Python:** `black`, `isort`
- **JS / TS / CSS / HTML:** `prettierd`

---

Built to stay stable across Neovim updates.

---

## License

MIT
