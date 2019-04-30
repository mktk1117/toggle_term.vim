"=============================================================================
" File: toggle_term.vim
" Author: tamiki
" Created: 2019-04-30
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_toggle_term')
    finish
endif
let g:loaded_toggle_term = 1

let s:save_cpo = &cpo
set cpo&vim

echo "In Plugin"

" With this maps you can now toggle the terminal
" nnoremap <F7> :call MonkeyTerminalToggle()<cr>
" tnoremap <F7> <C-\><C-n>:call MonkeyTerminalToggle()<cr>
command! TerminalToggle
\    call toggle_term#MonkeyTerminalToggle()
" nnoremap <silent><C-t> :call TerminalToggle()<cr>


let &cpo = s:save_cpo
unlet s:save_cpo
