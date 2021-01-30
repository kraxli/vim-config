bg Kraxli's Neo/vim Config

All credit goes to [Rafael Bodill](https://github.com/rafi/vim-config). The main and orginal [README](./README_Rafi.md) of  [Rafael Bodill](https://github.com/rafi/vim-config) you find [here](./README_Rafi.md)

This README highlights only the differences of my clone to the neovim vim config of [Rafael Bodill](https://github.com/rafi/vim-config).


Best with [Neovim] or [Vim8] and `python3` enabled.

> I encourage you to fork this repo and create your own experience.
> Learn how to tweak and change Neo/vim to the way YOU like it.
> This is my cultivation of years of tweaking, use it as a git remote
> and stay in-touch with upstream for reference or cherry-picking.

<details>
  <summary>
    <strong>Table of Contents</strong>
    <small><i>(🔎 Click to expand/collapse)</i></small>
  </summary>

<!-- vim-markdown-toc GFM -->

* [Difference to Rafael Bodill's vim-config](#difference-to-rafael-bodills-vim-config)
* [Install](#install)



<!-- vim-markdown-toc -->
</details>

## Install

**_1._** Let's clone this repo! Clone to `~/.config/nvim`,
we'll also symlink it for regular Vim:

```bash
mkdir ~/.config
git clone git://github.com/kraxli/vim-config.git ~/.config/nvim
cd ~/.config/nvim
rm -rf ~/.cache/vim
ln -s ~/.config/nvim ~/.vim  # For "regular" Vim
```

* _**Note**_: If you set a custom `$XDG_CONFIG_HOME`,
  use that instead of `~/.config` in the commands above.
  Neovim follows the XDG base-directories convention, Vim doesn't.

**_2._** Install the Python 3 `pynvim` library. This is also needed for Vim 8
if you want to use Denite and Defx.

> Neovim: `./venvs.sh` or `pip3 install --user pynvim`

> Vim: `pip3 install --user pynvim`

**_3._** Run `make test` to test your nvim/vim version and capabilities.

**_4._** Run `make` to install all plugins.

**_5._** If you are experiencing problems, run and read `nvim -c checkhealth`

Test Python 3 availability with `:py3 print(sys.version_info)`

Enjoy! :smile:

### Local settings / User custom config

```bash
ln -s your_local_config_dir ~/.config/nvim/local
# and / or
git clone your_local_config_repo_github ~/.config/nvim/local
```

### Recommended Tools

* **ag** [ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
  (macOS: `brew install the_silver_searcher`)
  * and/or **ripgrep**: [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)
* Jump around with **z**: [rupa/z](https://github.com/rupa/z) (macOS: `brew install z`)
  or [rupa/j2](https://github.com/rupa/j2) for the older python version
  (macOS: `brew install rg`)
  * or **z.lua**: [acme/zlua](https://github.com/skywind3000/z.lua)
* **[Universal ctags](https://ctags.io/)** for syntax tokenization
  (macOS: `brew install universal-ctags/universal-ctags/universal-ctags`)
* Fuzzy file finders:
  **[fzf](https://github.com/junegunn/fzf)**, (as of Feb. 10, 2020 install it in `/usr/local/opt/fzf`)
  **[fzy](https://github.com/jhawthorn/fzy)**, or
  **[peco](https://github.com/peco/peco)**
  (macOS: `brew install fzf`)
* **Tern** for Javascript completion (`npm -g install tern`)
* YAML parser: supported are [Ruby](https://www.ruby-lang.org/en/) (see also [RubyInstaller for Ms Windows](https://rubyinstaller.org/downloads/)), [yp](https://github.com/mikefarah/yq), and PyYaml(?)

### Recommended Color schemes
There are plenty of choices for color schemes, out of the box and to add by yourself. What I like from the ones out of the box are *gruvbox* and _(vim-)one_.

* As default I use the Monospace Regular 15 in Gnome Terminal
* Nerd-fonts (e.g. for more beautiful Defx icons): [ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
  e.g. MesloLGSDZ nerd Font Regular,  size 13. See also [Issue #109](https://github.com/rafi/vim-config/issues/109) or I also like: "MesloLGS Nerd Font Mono 18" and "Meslo LGSDZ Nerd Font Mono 16"


## Structure

* after/
* autoload/
* config/
  * ~~~local.vim~~~ 
  * [config/local.plugins.yaml](./config/local.plugins.yaml): Plugins different from plugins used by Rafi
* [config_kraxli](./config_kraxli): additional setups
  * ... 
* ~~~ftplugin/~~~
- [init.vim](./init.vim): define additional global variables
* local/: define your local directory with your local `init.vim` in where you define variables like `g:python_host_prog`, `g:python3_host_prog` and other variables you may want to set at the beginning. You can also put other files in this folder, e.g. a local `settings.vim` file. Other files than the `init.vim` in this folder are sourced at the end (so you can override preset settings and commands)
* themes/
* spell/
* README_Kraxli.md



## Upgrade / Update

```bash
cd <your installation path>
make update
```

This will run `git pull -ff --ff-only` and update all plugins using
[Shougo/dein.vim] package-manager.

## Updating Plugins with Dein

You will need to run `:call dein#clear_state()` and `:call dein#recache_runtimepath()` probably for certain plugins that dein merges.

- update the plugins installed by `:call dein#update()`
- Don't use `:UpdateRemotePlugins`, it ignores lazy-loaded plugins (via dein), so you better run: `:call dein#remote_plugins()` which will take into account the lazy ones.
- Reading the YAML files happens only once after they change. If you want to delete this cached state, run: `:call dein#clear_state()` and after the next you start n/vim, the state will rebuild.
- If you make a lot of modifications to your `local.plugins.yaml`, you'll eventually need to run `:call dein#recache_runtimepath()` for dein to re-merge all the plugin essentials. Run it with a fresh state.


## Different Key Mappings to Raphi's config
sg
sh
sv
```vim
  autocmd! FileType vimwiki,makdown inoremap <expr><buffer> <c-t> vimwiki#tbl#kbd_tab()
  autocmd! FileType vimwiki,makdown inoremap <expr><buffer> <c-s-t> vimwiki#tbl#kbd_shift_tab()
  autocmd! FileType vimwiki,makdown nnoremap ]l <Plug>VimwikiNextLink<cr>
  autocmd! FileType vimwiki,makdown nnoremap [l <Plug>VimwikiPrevLink<cr>
  autocmd! FileType vimwiki,makdown inoremap <expr><silent><buffer> <CR> pumvisible() ? "\<C-R>=complete#smart_carriage_return()<CR>" :  "\<C-]><Esc>:VimwikiReturn 1 5<CR>"
```

### Plugin: Asyncomplete and Emmet
| <kbd>Ctrl</kbd>+<kbd>f</kbd> | 𝐈 𝐒 | Jump to next snippet placeholder
| <kbd>Ctrl</kbd>+<kbd>b</kbd> | 𝐈 𝐒 | Jump to previous snippet placeholder

### Discoveries / Enhancements
<kbd>,<kbd>c<kbd> : some selections from ...
<kbd>K<kbd> : <kbd>normla<kbd> , documentation through LSP
<kbd><space>l <kbd>normla<kbd>
<kbd><space>b or <space>a <kbd>normla<kbd>

<kbd><space>f <kbd>normla<kbd>

### Plugin: Denite
| <kbd>Space</kbd>+<kbd>gl</kbd> | 𝐍 | Git log (all)
| <kbd>Space</kbd>+<kbd>gs</kbd> | 𝐍 | Git status
| <kbd>Space</kbd>+<kbd>gc</kbd> | 𝐍 | Git branches

## Prerequisites

* Virtualenv tool for Python 3 (not required from Python 3.6 on - I think):
  ```bash
  pip3 install virtualenv
  ```
  On Ubuntu you can use:
  ```bash
  apt-get install -y python3-venv
  ```
* yarn (required for [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim))  
  ```sh
  sudo apt-get -y install yarn
  ```
  


## Difference to [Rafael Bodill's vim-config](https://github.com/rafi/vim-config)
# Miscellaneous

Snippets: a snippet fully written out needs to be triggered by `<c-l>` (expand trigger) or selected by `<c-tab>` from the pop-up/selction menu and triggered by `<CR>`. A partially written snippet can be selected from the suggestion of the pop-up by `<c-n/p>` or `<c-j/k>` and completed (expanded) by `<CR>`.

## Reminers
- Copy / get absolute or relative path of current file, relative: `<leader>y`, absolute: `<leader>Y`

