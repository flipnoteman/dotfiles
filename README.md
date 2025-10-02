# dotfiles

### 1. Clone repository
```ps1
git clone https://github.com/flipnoteman/dotfiles.git

```

### 2. Create symlinks (Nvim for example)
#### Windows:
```ps1
mklink %USERPROFILE%\AppData\Local\nvim \path\to\repo\nvim
```
#### Linux:
```sh
ln -nfs /path/to/repo/nvim $HOME/.config/nvim
```
#### Dependencies for Nvim config (WSL)
```sh
sudo apt update
sudo apt install clang gcc luarocks unzip npm ripgrep fd-find zathura

# Install fzf (Ubuntu repo not updated)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install rust (mainly for treesitter)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install --locked tree-sitter-cli
```

