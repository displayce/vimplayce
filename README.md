# vimplayce

## plugins
List of installed plugins :
- [packer.nvim][1]
- [nvim-lspconfig][2]
-

[1]: https://github.com/wbthomason/packer.nvim
[2]: https://github.com/neovim/nvim-lspconfig

## development
### venv
The venv script at project's root is a virtual environment setting development script.  
More information : `./venv --help`

### project structure
```sh
.
├── nvim
│   ├── init.lua             # config entry point
│   └── lua
│       ├── autocmds         # neovim autocommands
│       │   └── init.lua
│       ├── config           # neovim/plugins config
│       │   └── init.lua
│       ├── keymaps          # custom keymaps
│       │   └── init.lua
│       └── packer           # packer config
│           ├── init.lua
│           ├── lsp.lua      # lsp related plugins
│           └── user.lua     # other user plugins
├── README.md
└── venv
```
