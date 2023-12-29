# Personal Dotfiles

I'm sharing my Neovim, Starship, and PowerShell configurations. Please note that I have only tested them on Windows 10 & 11. If you try them on another operating system, you may encounter some problems.

## Install

### Install `Neovim` & `starship`

```bash
scoop install neovim starship
```

### Clone the current repository

```bash
git clone https://github.com/zitrocode/dotfiles $HOME
```

### Add the following line in `$PROFILE`

```PowerShell
Import-Module "$HOME\.config\powershell\init.ps1"
```

### ⚠ Important

Don't forget to install [Packer.nvim](https://github.com/wbthomason/packer.nvim) and then, within Neovim, run: `:PackerInstall`.

---

At this point, you should be able to enjoy my Neovim configuration. It has support for the following languages: JavaScript, TypeScript, CSS, Sass, HTML, and JSON.

## Keyboard shortcuts

| Modo | Atajo      | Descripción                                                     |
| ---- | ---------- | --------------------------------------------------------------- |
| `n`  | `x`        | Eliminar texto sin afectar el registro                          |
| `n`  | `*`        | Buscar la palabra bajo el cursor                                |
| `n`  | `<Space>s` | Buscar y reemplazar en todo el archivo                          |
| `n`  | `<C-s>`    | Guardar el archivo                                              |
| `n`  | `<C-q>`    | Guardar y salir de Neovim                                       |
| `n`  | `+`        | Incrementar el número bajo el cursor                            |
| `n`  | `-`        | Decrementar el número bajo el cursor                            |
| `n`  | `dw`       | Eliminar una palabra hacia atrás, manteniendo el registro vacío |
| `n`  | `<C-a>`    | Seleccionar todo el archivo                                     |
| `n`  | `<C-t>`    | Abrir una nueva pestaña                                         |
| `n`  | `<Tab>`    | Moverse a la siguiente pestaña                                  |
| `n`  | `<S-Tab>`  | Moverse a la pestaña anterior                                   |
| `n`  | `to`       | Cerrar todas las pestañas, excepto la actual                    |
| `n`  | `ss`       | Dividir la ventana horizontalmente y cambiar a ella             |
| `n`  | `sv`       | Dividir la ventana verticalmente y cambiar a ella               |
| `n`  | `sh`       | Moverse a la ventana a la izquierda                             |
| `n`  | `sk`       | Moverse a la ventana arriba                                     |
| `n`  | `sj`       | Moverse a la ventana abajo                                      |
| `n`  | `sl`       | Moverse a la ventana a la derecha                               |
| `n`  | `ml`       | Reducir el tamaño de la ventana horizontalmente                 |
| `n`  | `mh`       | Aumentar el tamaño de la ventana horizontalmente                |
| `n`  | `mk`       | Aumentar el tamaño de la ventana verticalmente                  |
| `n`  | `mj`       | Reducir el tamaño de la ventana verticalmente                   |
| `n`  | `<C-n>`    | Alternar NERDTree                                               |
| `n`  | `<Space>/` | Comentar la línea actual o el texto visual                      |
| `v`  | `<Space>/` | Comentar el texto seleccionado                                  |
