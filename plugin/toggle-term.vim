"=============================================================================
" File: toggle-term.vim
" Author: tamiki
" Created: 2019-04-30
"=============================================================================

scriptencoding utf-8

if exists('g:loaded_toggle-term')
    finish
endif
let g:loaded_toggle-term = 1

let s:save_cpo = &cpo
set cpo&vim

echo "In Plugin"

let s:monkey_terminal_window = -1
let s:monkey_terminal_buffer = -1
let s:monkey_terminal_job_id = -1

" With this maps you can now toggle the terminal
" nnoremap <F7> :call MonkeyTerminalToggle()<cr>
" tnoremap <F7> <C-\><C-n>:call MonkeyTerminalToggle()<cr>
command! MonkeyTerminalToggle
\    call toggle-term#MonkeyTerminalToggle()
nnoremap <silent><C-t> :call MonkeyTerminalToggle()<cr>


let &cpo = s:save_cpo
unlet s:save_cpo
