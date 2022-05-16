<h1 align="center">nvimfiles</h1>
<br>
<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/3/3a/Neovim-mark.svg"
       width="100"
       alt="Neovim"/>
</p>

<p align="center">
  My Neovim files.
</p>

<p align="center">
  <a href="https://github.com/gcoguiec/nvimfiles/actions/workflows/ci.yml">
    <img src="https://github.com/gcoguiec/nvimfiles/actions/workflows/ci.yml/badge.svg"
         alt="GitHub Actions Status"/>
  </a>
  <a href="https://github.com/neovim/neovim">
    <img src="https://img.shields.io/badge/Neovim-0.7+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white"
         alt="Neovim Version"/>
  </a>
  <a href="https://github.com/gcoguiec/nvimfiles/blob/main/LICENSE.md">
    <img src="https://img.shields.io/github/license/gcoguiec/nvimfiles?style=flat-square&label=License"
         alt="License"/>
  </a>
</p>

<hr>

## Table of Contents

- [Features](#features)
- [Previews](#previews)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [License](#license)

## Features

- ~200ms startup time (even less once cached with [Impatient](https://github.com/lewis6991/impatient.nvim)).
- Full [LSP](https://neovim.io/doc/user/lsp.html) support (go-to-definition, find-references, refactor and smart autocompletion).
- Incremental syntax parsing and highlighting via [Tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter).
- A fast fuzzy finder using [Telescope](https://github.com/nvim-telescope/telescope.nvim) and [fzf](https://github.com/junegunn/fzf).
- Integration with the most popular static code analysis tools and autoformatters (rustfmt, rust_analyzer, eslint, prettier, and more).
- Plugin management via [Packer](https://github.com/wbthomason/packer.nvim).
- A [Shade of Purple](https://github.com/ahmadawais/shades-of-purple-vscode)-like look and feel.
- And a boatload of very opinioned tweaks.

## Previews

<p align="center">
  <a href="https://raw.githubusercontent.com/gcoguiec/nvimfiles/main/.github/preview0.png">
    <img src="https://raw.githubusercontent.com/gcoguiec/nvimfiles/main/.github/preview0.png"
         width="200"
         alt="First Preview"/>
  </a>
  <a href="https://raw.githubusercontent.com/gcoguiec/nvimfiles/main/.github/preview1.png">
    <img src="https://raw.githubusercontent.com/gcoguiec/nvimfiles/main/.github/preview1.png"
         width="200"
         alt="Second Preview"/>
  </a>
  <a href="https://raw.githubusercontent.com/gcoguiec/nvimfiles/main/.github/preview2.png">
    <img src="https://raw.githubusercontent.com/gcoguiec/nvimfiles/main/.github/preview2.png"
         width="200"
         alt="Third Preview"/>
  </a>
</p>

## Dependencies

- Neovim 0.7+
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Installation

```sh
make install
make link
```

## Available Commands

| Task               |                  Description                   |
| ------------------ | :--------------------------------------------: |
| `make install`     | Download the plugins, parsers and LSP servers. |
| `make dev_install` |         Install the development tools.         |
| `make link`        | Create a symlink to your ~/.config/nvim folder |
| `make unlink`      |   Remove the symlink created by `make link`    |
| `make update`      |        Update the plugins and parsers.         |
| `make fmt`         |            Reformat the code-base.             |
| `make lint`        |              Lint the code-base.               |
| `make test`        |                 Run the tests.                 |
| `make clean`       |  Remove the plugins, parsers and LSP servers.  |

## License

This project is licensed under [BSD 2-Clause](https://spdx.org/licenses/BSD-2-Clause.html).
