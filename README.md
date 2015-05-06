# My Vim Config

Hosts my vimrc and necessary information for quickly setting up my vim on multiple machines.

### In Linux
- Clone repository to ~/.vim
- Delete ~/.vimrc
- Create symlink from ~/.vimrc to ~/.vim/vimrc

### In Windows
- Delete vimfiles directory and _vimrc
- Clone repository
- Create symlink from vimfiles to .vim/ and _vimrc to .vim/vimrc

### Initialise
cd into your .vim/ folder and run:  
```
git submodule update --init --recursive  
```

Make sure VIM_HOME is set and add .vim/libs to path
