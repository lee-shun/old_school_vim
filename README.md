# <p align="center">![tittle](./img/old_school_vim.png)</p>

> Due to my study and work, I always want to use vim under different environments. So, I always choose the plugins with
> good compatibility. In my opinion, I prefer the plugins written in `vimscripts > vimscripts + python3 > lua`.Comparing
> with today's neovim lua trending, The plugins in this configuration are pretty "**Old-School**"!

**In this vim/neovim configuration, I tried to:**

- choose and config the plugins with good compatibility, which can work under `Linux (x86_64, aarch64)`,
  `Windows (x86_64)` and even `git bash`.
- use as less dependences as possible to accomplish the functions.
- keep the original vim keybindings and operations.
- use `dein.vim` to lazy load most of the plugins.

## Requirements

### Vim & Neovim Version

- vim 8.2 if use `Ulti-Mode`, vim 7 if use `Mini-Mode`
- neovim 4.2 or later, no matter what modes.

### Environment

- `nodejs`, if use `coc.nvim`
- `python3`, if use `deoplete.nvim`
- `language servers` if use `vim-lsp` or `coc.nvim`

## Quick Start

- use the `config_env.sh` to install the dependencies...

- **Mini-Mode:** set `g:osv_ulti_mode` to `0` in [init.vim](init.vim)

  > use vim as an excellent text editor!

  - Zero dependencies.
  - Fully portable.
  - Pure vimscripts.

- **Ulti-Mode** set `g:osv_ulti_mode` to `1` in [init.vim](init.vim)

  - `g:osv_plug_general = 1`

    - general editor enhancement plugins.

  - `g:osv_plug_advanced = 1`

    - file type based special plugins.

  - `g:osv_plug_coc = 1`

    - use coc as `lsp + completion engine` and much more.

  - `g:osv_plug_lsp = 1`
    - language-sever based code completion, etc.
    - choose one from `completion eigen`:
      - `g:osv_plug_deoplete`
      - `g:osv_plug_asyncomplete`

- **NOTE:**

  - 🆘 using `Anaconda3` instead of the system default `python` may cause problems with python path and `pynvim`
    installation. Under this situation, tweaking manually may be needed.

  - the support of `coc.nvim` on `aarch64` is not good, try to avoid this.

## Installation

You can also use the bash files under the `env/` folder.

1. **clone the repo to the path:**
   - **For Windows:**
     - Neovim configuration path: `~/Appdata/Local/nvim`
     - Vim configuration path(For Git Bash): `~/.vim`
     - Gvim configuration path: `~/vimfiles`
   - **For Linux:**
     - Neovim configuration path: `~/.config/nvim`
     - Vim configuration path: `~/.vim`
2. **choose your mode**
3. enter vim and **`:call dein#install()`**

   - several times (at least 2) of `dein#install()` are required to make sure the correct plugins installation.
   - `:UpdateRemotePlugins` may also needed...

4. **install the python and language-severs if applicable.**

## Screen Shots

### Mini-Mode

| **Environment**                                                          | **Screen Shots**               |
| ------------------------------------------------------------------------ | ------------------------------ |
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/mini_linux.png) |
| <kbd>Windows 10</kbd> + <kbd>Neovim 5.0</kbd> + <kbd>Alacritty</kbd>     | ![image](./img/mini_win.png)   |

### Ulti-Mode & Advanced Features

**NOTE:** Please notice that the Gvim on Windows will confuse the Git Bash with
its own vim.

| **Environment**                                                          | **Screen Shots**                          |
| ------------------------------------------------------------------------ | ----------------------------------------- |
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/Linux_x86_64_ulti_coc.png) |
| <kbd>Windows 10</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Git Bash</kbd>         | ![image](./img/win_vim_git_bash.png)      |
| <kbd>Windows 10</kbd> + <kbd>GVim 8.2</kbd>                              | ![image](./img/win_gvim.png)              |

## The file explorer keymaps

`<leader>t`: toggle file explorer

| keys    | functions                                            |
| ------- | ---------------------------------------------------- |
| `j, k`  | up and down                                          |
| `h, l`  | left and right, but collapse or expand the tree node |
| `J, K`  | toggle mark (select) multiple items                  |
| `*`     | toggle select all                                    |
| `H, L`  | collapse all (recursively), expand all (recursively) |
| `q`     | quit                                                 |
| `<CR>`  | open file or cd to the direcory                      |
| `<BS>`  | cd to the parent directory                           |
| `<TAB>` | action                                               |
| `s`     | split and open                                       |
| `o`     | toggle open tree                                     |
| `v`     | vsplit and open                                      |
| `t`     | new tab and open                                     |
| `i`     | preview or show details of the item                  |
| `yp`    | copy file path                                       |
| `yy`    | copy file(s)                                         |
| `yn`    | copy file name                                       |
| `dd`    | cut file(s)                                          |
| `p`     | paste file(s)                                        |
| `df`    | delete/trash file(s)                                 |
| `dF`    | delete/trash file(s), force or forever               |
| `a`     | add file(s), maybe path with "/"                     |
| `A`     | add directory(s)                                     |
| `r`     | rename                                               |
| `f`     | filter                                               |
| `<C-r>` | refresh                                              |
| `<C-h>` | toggle hidden items                                  |
| `<C-i>` | toggle gitignore items                               |
| `!`     | execute vim cmd                                      |
| `x`     | system execute                                       |
| `?`     | help                                                 |

> Last Modified : 二 13 9 月 2022 08:21:11 下午
