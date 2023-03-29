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

## Shortcuts (because it's hard to remember all of them)

### Refactoring
#### Vim Abolish
Case style refactoring : 
- snake_case (crs) 
- MixedCase (crm)
- camelCase (crc)
- snake_case (crs)
- UPPER_CASE (cru)
- dash-case (cr-)
- dot.case (cr.)
- space case (cr\<space\>)
- Title Case (crt)

#### Coc
Workspace refactoring :
- rename (,rn)

### File seaching
#### FZF
- :Files to open the file searching window
- Ctrl + V to open the file in new vertical split
- Ctrl + T to open the file in new tab
- Ctrl + S to open the file in new split
