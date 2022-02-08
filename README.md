# <p align="center">![title](./img/pure_vim.png)</p>

> I just want to use my Vim configuration on different machines😹, but various Plugins and their dependencies always
> drive me crazy, especially under different environment! Some of them require `python`(which is reasonable at some
> point), some require `nodejs`.  But most of times, they requires the so-called **DEPENDENCIES**❌ that I never heard
> about! I am **NOT almighty** 🤖 , you got be kidding me!😠

**In this vim/neovim configuration, I tried to:**
- separate the whole `vimrc` into `dependence-free` and `dependences` parts according to the features required by
  workflow.
- use as less dependences as possible to accomplish the functions.
- keep the original vim keybindings and operations.

## Quick Start

- **Mini-Mode:** set `g:pure_vim_ulti` to `0` in [init.vim](init.vim)
  > use vim as an excellent text editor!
  >
  > - No Plugins, No Dependencies.
  >
- **Ulti-Mode** set `g:pure_vim_ulti` to `1` in [init.vim](init.vim)
  > use vim with some pretty neat plugins
  >
  > - dependence-free plugins written in Vimscripts.
  >
- **Advanced Features:** set `g:pure_vim_ulti` and `g:pure_vim_advanced` both to `1` in [init.vim](init.vim)
  > use vim as a lightweight IDE for `C/C++` and `python`.
  >
  > - multi language translations based on python plugins.
  > - language-sever based code completion, etc.
  >
- **NOTE:**
  - 🆘 using `Anaconda3` instead of the system default `python` may cause problems with python path and `pynvim`
  installation. Under this situation, use `neovim` instead.

## Requirements

- vim 8.2.
- neovim 4.2 or later.
- *python and language-sever stuff(advanced features only)

## Features

1. **As less dependences as possible**
  - use vim with different level of demands.

2. **Completion**
  - Automatically commonly used words completion with google-20k words.
  - The commonly used programming languages like `python` and `c++` etc.
  key-words completion.
  - `deoplete.nvim` and `vim-lsp` based completion

3. **Multi Platforms Supporting**

4. **Snippets**
  - Simple snippets inserting with vim `inoremap` option.
  - Vim will load `xxx_foo.vim, xxx.vim` (`xxx` is a filetype name.). With this
    feature, I define some useful `remaps`.

5. **Especially Designed for Notes Taking**
  - Use [markdown-wiki](https://github.com/mmai/vim-markdown-wiki)
  to arrange the notes.
  - [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim)(it
  needs to download a binary markdown software, but don't worry, it is
  automatic.)

6. **Automatically Configuration Path Setting**
  - This configuration is designed for vim and neovim both on windows and
  Linux.
  - It will automatically find the path for the given situation.

## Installation

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
|--------------------------------------------------------------------------|--------------------------------|
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/mini_linux.png) |
| <kbd>Windows 10</kbd> + <kbd>Neovim 5.0</kbd> + <kbd>Alacritty</kbd>     | ![image](./img/mini_win.png)   |

### Ulti-Mode & Advanced Features

**NOTE:** Please notice that the Gvim on Windows will confuse the Git Bash with
its own vim.

| **Environment**                                                          | **Screen Shots**                     |
|--------------------------------------------------------------------------|--------------------------------------|
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/linux_vim.png)        |
| <kbd>Windows 10</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Git Bash</kbd>         | ![image](./img/win_vim_git_bash.png) |
| <kbd>Windows 10</kbd> + <kbd>GVim 8.2</kbd>                              | ![image](./img/win_gvim.png)         |

> Last Modified : 一 07 2月 2022 08:42:00 下午
