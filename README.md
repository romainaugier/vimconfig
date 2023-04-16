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

## Coc
NodeJS :
- Download and install [NodeJS](https://nodejs.org/en) and put it in the PATH

Servers :
- (C/C++) [Clang](https://releases.llvm.org/download.html) must be in the PATH and run `:CocInstall coc-clangd`
- (Python) `pip install pylint` and pylint must be in the PATH and run `:CocInstall coc-pyright`
- (Lua) run `:CocInstall coc-lua`
- (VimScript) run `:CocInstall coc-vimlsp`
- (CMake) run `:CocInstall coc-cmake`
- (Bash) run `:CocInstall coc-sh` 
- (Markdown) run `:CocInstall coc-markdownlint`
- (Json) run `:CocInstall coc-json`

### Shortcuts

| Action | Shortcut |
| ------ | ---------|
| Convert to snake_case | `crs` |
| Convert to MixedCase  | `crm` | 
| Convert to camelCase  | `crc` |
| Convert to UPPER_CASE | `cru` |
| Convert to dash-case  | `cr-` |
| Convert to dot.case   | `cr.` |
| Convert to space case | `cr<space>` |
| Convert to Title Case | `crt` |
| Rename symbol         | `,rn` |
| Go to symbol          | `gd`  |
| Go to symbol in vsplit | `gsd` |
| Cursor on symbol to generate documentation | `,d` |
| Open File Search      | `<C-F>` |
