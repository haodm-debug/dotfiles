## Development Environment in Linux

This is my entire `Development Environment` setup in `Linux`, feel free to try it!

### Prerequesites

#### Main tools
1. `wezterm` : Terminal Emulator
2. `tmux` : Terminal multiplexer
3. `neovim` : Code editor
4. `GNU Stow` : Symlink management tool
5. `ripgrep` : Enable telescope to search File grep

Note: I also recommend install those tools: `bat`, `lazydocker` (can be installed by using your OS packet manager - `apt install` in my case).

#### Fonts
- Use fonts in `dotfiles/fonts/`

#### Programming languages
- Java 21 
- Python


### Installing steps
With stow you can create symlink from a directory to a target directory.
So ideally, all settings shoul be in a directory, for example `~/dotfiles`

```shell
cd
mkdir dotfiles
```

After that, create dir tree structure for each tool with same structure as in its docs.
For instance, with nvim, you should place your configs in `~/.config/nvim`

-> Create dir structure like this in dotfiles

```shell
cd ~/dotfiles
mkdir -p nvim/.config/nvim
```

Do the same steps with the other tools.
Then run this to create symlinks

```shell
stow nvim
stow zsh
stow tmux
stow wezterm
```

for more information about gnustow: [link](https://www.gnu.org/software/stow/)


### Nvim setup

- I use lazy to manage plugins, you can use packer
- To sync or update plugins

```shell
:Lazy sync
:Lazy update
```

- I think it's better if we keep our settings at a simple level, don't set many things
  that you rarely use or you can achieve this purpose by some simple commands.

- Check log lsp:

```shell
nvim ~/.local/state/nvim/lsp.log
```

or

```
:LspLog
```

- Vim help is so helpful. Use it as much as you can
  example

```
:help Mason
```
