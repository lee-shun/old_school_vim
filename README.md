# <p align="center">![tittle](./img/old_school_vim.png)</p>

> Due to my study and work, I always want to use with under different environments. So, I always choose the plugins with
> good compatibility. In my opinion, I prefer the plugins written in `vimscripts > vimscripts + python3 > lua`.Comparing with today's neovim lua trending, The plugins in this configuration are pretty "**Old-School**"!

**In this vim/neovim configuration, I tried to:**

- separate the whole `vimrc` into `dependence-free` and `dependences` parts.
- use as less dependences as possible to accomplish the functions.
- keep the original vim keybindings and operations.
- use `dein` to lazy load most of the plugins.

## Quick Start

- use the `config_env.sh` to install the dependencies...

- **Mini-Mode:** set `g:old_school_vim_ulti_mode` to `0` in [init.vim](init.vim)
  > use vim as an excellent text editor!
  >
  > - No Plugins, No Dependencies.
- **Ulti-Mode** set `g:old_school_vim_ulti_mode` to `1` in [init.vim](init.vim)

  > use vim with some pretty neat plugins

  - `g:old_school_vim_plug_general = 1`
    > dependence-free plugins written in Vimscripts.
  - `g:old_school_vim_plug_advanced = 1`

    > plugins based on python3.

  - `g:old_school_vim_plug_lsp = 1 `

    > language-sever based code completion, etc.

  - choose one from `completion eigen`:
    - `g:old_school_vim_plug_deoplete`
    - `g:old_school_vim_plug_asyncomplete`

- **NOTE:**
  - 🆘 using `Anaconda3` instead of the system default `python` may cause problems with python path and `pynvim`
    installation. Under this situation, tweaking manually may be needed.

## Requirements

- VIM

  - vim 8.2 if use plugins, vim 7 if use `mini-mode`

- NEOVIM

  - neovim 4.2 or later.

- _python3_ for (advanced plugins) and _language-server stuff_ for (vim-lsp)

## Installation

You can also use the bash files under the `env/` folder.

1. **Clone the repo to the path:**

- **For Windows:**
  - Neovim configuration path: `~/Appdata/Local/nvim`
  - Vim configuration path(For Git Bash): `~/.vim`
  - Gvim configuration path: `~/vimfiles`
- **For Linux:**
  - Neovim configuration path: `~/.config/nvim`
  - Vim configuration path: `~/.vim`

2. **Choose your mode:**

3. **Install the python and language-severs if applicable.**

## Screen Shots

### Mini-Mode

| **Environment**                                                          | **Screen Shots**               |
| ------------------------------------------------------------------------ | ------------------------------ |
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/mini_linux.png) |
| <kbd>Windows 10</kbd> + <kbd>Neovim 5.0</kbd> + <kbd>Alacritty</kbd>     | ![image](./img/mini_win.png)   |

### Ulti-Mode & Advanced Features

**NOTE:** Please notice that the Gvim on Windows will confuse the Git Bash with
its own vim.

| **Environment**                                                          | **Screen Shots**                     |
| ------------------------------------------------------------------------ | ------------------------------------ |
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/linux_vim.png)        |
| <kbd>Windows 10</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Git Bash</kbd>         | ![image](./img/win_vim_git_bash.png) |
| <kbd>Windows 10</kbd> + <kbd>GVim 8.2</kbd>                              | ![image](./img/win_gvim.png)         |

> Last Modified : 二 13 9 月 2022 08:21:11 下午
