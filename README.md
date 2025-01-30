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

