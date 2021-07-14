# Pure Vim

```

       ___          ___          ___          ___                  ___                   ___
      /\  \        /\__\        /\  \        /\  \                /\__\        ___      /\__\
     /::\  \      /:/  /       /::\  \      /::\  \              /:/  /       /\  \    /::|  |
    /:/\:\  \    /:/  /       /:/\:\  \    /:/\:\  \            /:/  /        \:\  \  /:|:|  |
   /::\~\:\  \  /:/  /  ___  /::\~\:\  \  /::\~\:\  \          /:/__/  ___    /::\__\/:/|:|__|__
  /:/\:\ \:\__\/:/__/  /\__\/:/\:\ \:\__\/:/\:\ \:\__\         |:|  | /\__\__/:/\/__/:/ |::::\__\
  \/__\:\/:/  /\:\  \ /:/  /\/_|::\/:/  /\:\~\:\ \/__/         |:|  |/:/  /\/:/  /  \/__/~~/:/  /
       \::/  /  \:\  /:/  /    |:|::/  /  \:\ \:\__\           |:|__/:/  /\::/__/         /:/  /
        \/__/    \:\/:/  /     |:|\/__/    \:\ \/__/            \::::/__/  \:\__\        /:/  /
                  \::/  /      |:|  |       \:\__\               ~~~~       \/__/       /:/  /
                   \/__/        \|__|        \/__/                                      \/__/
```

This is a totally dependence-free vim/neovim configuration And it has the
*Mini-Mode* and *Ulti-Mode*, which is controled by the `g:pure_vim_mini`
variable defined in [init.vim](./init.vim).

## Features:

1. **Dependence-free**

    All of the plugins used in this configuration  is **pure vim script**,
    no lua-based plugins or third-party software are needed.

    - **Mini-Mode**
        - Not Plugins at all.

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
    - [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim)

## Installation

- **All Platform Supporting and Portable**
    - **Mini-Mode**
        - Set `g:pure_vim_mini` to `1`
        - Fully platforms supporting(Linux/Windows/MacOS).
    - **Ulti-Mode**
        - Set `g:pure_vim_mini` to `0`
        - use [vim-plug](https://github.com/junegunn/vim-plug), all
        the plugins are also dependence-free.
        - Run `PlugInstall` after cloning the repo.
---

## Mini-Mode on Windos 10 with Git Bash
![image](./snap2.png)
## Ulti-Mode on Linux with Gnome-Terminal
![image](./snap1.png)
