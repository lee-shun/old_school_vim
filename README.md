# ![title](./img/pure_vim.png)

> I just want to use my Vim configuration on different machines😹, but various
> Plugins and their dependencies always drive me crazy, especially under
> different environment! Some of them require `python`, some require `nodejs`.
> But most of the time, they requires the **DEPENDENCIES**❌ that I never heard
> about! I am **NOT almighty**, you got be kidding me!😠

- This is a totally dependence-free vim/neovim configuration. (Yes, even `python`)
- It has the **Mini-Mode** and **Ulti-Mode**, which is controlled by the
 `g:pure_vim_mini` variable defined in [init.vim](./init.vim).

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

3. **All Platform Supporting and Portable**
    - Clone and Use without any pain.

4. **Snippets**
    - Simple snippets inserting with vim `inoremap` option.

5. **Especially Designed for Notes Taking**
    - Use [markdown-wiki](https://github.com/mmai/vim-markdown-wiki)
    to arrange the notes.
    - [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim)(it
    need download a binary markdown software, but don't worry it is automatic.)

6. **Automatically Configuration Path Setting**
    - This configuration is designed for vim and neovim both on windows and
    Linux.
    - **For Windows:**
      - Neovim configuration path: `~/Appdata/Local/nvim`
      - Vim configuration path(For Git Bash): `~/.vim`
    - **For Linux:**
      - Neovim configuration path: `~/.config/nvim`
      - Vim configuration path(For Git Bash): `~/.vim`

## Installation

- **All Platform Supporting and Portable**
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

- [x] Ubuntu 18.04 + vim 8.2 + Xfce4-terminal

![image](./img/mini_linux.png)

- [x] Windows 10 + Git Bash + Vim 8.2

![image](./img/linux_vim.png)

### Ulti-Mode 
- [x] Ubuntu 18.04 + vim 8.2 + Xfce4-terminal

![image](./img/win_vim_git_bash.png)

- [x] Windows 10 + Git Bash + Vim 8.2

![image](./img/linux_vim.png)
