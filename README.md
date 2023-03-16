# Vim Configuration

[Vim Cheat Sheet](https://quickref.me/vim)

[Vim Multiple Cursors](https://vimawesome.com/plugin/vim-multiple-cursors)

## Installing vimplug

*Linux*
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

*Windows (PowerShell)*
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force
```

*Windows (cmd)*
```
mkdir %USERPROFILE%\vimfiles\autoload
bitsadmin /transfer "VimPlug Download" "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" "%USERPROFILE%\vimfiles\autoload\plug.vim"
```

## Installing .vimrc file

*Linux*
```bash
curl -fLo ~/.vimrc https://raw.githubusercontent.com/romainaugier/vimconfig/main/.vimrc
```
*Windows (PowerShell)*
```
iwr -useb https://raw.githubusercontent.com/romainaugier/vimconfig/main/.vimrc | ni $HOME/_vimrc -Force
```

*Windows (cmd)*
```batch
bitsadmin /transfer "Vimrc Download" "https://raw.githubusercontent.com/romainaugier/vimconfig/main/.vimrc" "%USERPROFILE%\_vimrc"
```

## LSP

Installs :
- (C/C++) [Clang](https://releases.llvm.org/download.html) must be in the PATH
- (Python) `pip install python-lsp-server[all]` and pylsp must be in the PATH
- (Lua) [lua-language-server](https://github.com/LuaLS/lua-language-server) must be in the PATH
