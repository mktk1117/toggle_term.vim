## toggle_term.vim
This is the plugin to toggle a terminal inside vim.  
Script is from https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23

## installation
if you're using dein,
```toml
[[plugins]]
repo = 'mktk1117/toggle_term.vim'
hook_add = '''
nnoremap <C-t> :call toggle_term#MonkeyTerminalToggle()<cr>
tnoremap <C-t> <C-\><C-n>:call toggle_term#MonkeyTerminalToggle()<cr>
'''
```
