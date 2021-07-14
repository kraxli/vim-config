title: installation

# WSL (Windows Subsystem for Linux)

I had to hard code the path-variable `XDG_DATA_HOME` in the file `config/init.vim` to run `make` for the installation of the plugins by `dein`:

```vim
  let $XDG_DATA_HOME = '/home/dave/.local/share'
```

