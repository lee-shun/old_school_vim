# <p align="center">![title](./img/pure_vim.png)</p>

> I just want to use my Vim configuration on different machines😹, but various
> Plugins and their dependencies always drive me crazy, especially under
> different environment! Some of them require `python`, some require `nodejs`.
> But most of times, they requires the so-called **DEPENDENCIES**❌ that I never heard
> about! I am **NOT almighty** 🤖 , you got be kidding me!😠

- This is a totally dependence-free vim/neovim configuration. (Yes, even `python`)
- It has the **Mini-Mode** and **Ulti-Mode**, which is controlled by the
 `g:pure_vim_mini` variable defined in [init.vim](./init.vim).

## Requirements

- vim 8.2.
- neovim 4.2 or later.

## Features

1. **Dependence-free**

    All of the plugins used in this configuration  is **pure vim script**,
    no lua-based plugins or third-party software are needed.

  - **Mini-Mode**
    - Not Plugins, No Dependencies.
  - **Ulti-Mode**
    - Some dependence-free Plugins written in Vimscripts.

2. **Completion**
  - Automatically commonly used words completion with google-20k words.
  - The commonly used programming languages like `python` and `c++` etc.
    key-words completion.
  - Unicode completion by [unicode.vim](https://github.com/chrisbra/unicode.vim)

3. **All Platform Supporting and Portable**
  - Clone and Use without any pain.

4. **Snippets**
  - Simple snippets inserting with vim `inoremap` option.

5. **Especially Designed for Notes Taking**
  - Use [markdown-wiki](https://github.com/mmai/vim-markdown-wiki)
    to arrange the notes.
  - [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim)(it
    needs to download a binary markdown software, but don't worry, it is automatic.)

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

2.  **Choose your mode:**
  - **Mini-Mode**
    - Set `g:pure_vim_mini` to `1` in [init.vim](./init.vim).
    - Fully platforms supporting(Linux/Windows/MacOS).
  - **Ulti-Mode**
    - Set `g:pure_vim_mini` to `0` in [init.vim](./init.vim).
    - Use [vim-plug](https://github.com/junegunn/vim-plug), all
      the plugins are also dependence-free.
    - Run `:PlugInstall` in (neo)vim after cloning the repo.
    - Fully platforms supporting(Linux/Windows/MacOS).

## Screen Shots

### Mini-Mode

| **Environment**                                                          | **Screen Shots**               |
|--------------------------------------------------------------------------|--------------------------------|
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/mini_linux.png) |
| <kbd>Windows 10</kbd> + <kbd>Neovim 5.0</kbd> + <kbd>Alacritty</kbd>     | ![image](./img/mini_win.png)   |

### Ulti-Mode 

**NOTE:** Please notice that the Gvim on Windows will confuse the Git Bash with
its own vim.

| **Environment**                                                          | **Screen Shots**                     |
|--------------------------------------------------------------------------|--------------------------------------|
| <kbd>Ubuntu 18.04</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Xfce4-terminal</kbd> | ![image](./img/linux_vim.png)        |
| <kbd>Windows 10</kbd> + <kbd>Vim 8.2</kbd> + <kbd>Git Bash</kbd>         | ![image](./img/win_vim_git_bash.png) |
| <kbd>Windows 10</kbd> + <kbd>GVim 8.2</kbd>                              | ![image](./img/win_gvim.png)         |

## TODO

- [x] For Gvim on Windows
