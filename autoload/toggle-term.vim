"=============================================================================
" File: toggle-term.vim
" Author: takahiro
" Created: 2019-04-30
"=============================================================================

scriptencoding utf-8

if !exists('g:loaded_toggle-term')
    finish
endif
let g:loaded_toggle-term = 1

let s:save_cpo = &cpo
set cpo&vim

" This script is from https://gist.github.com/ram535/b1b7af6cd7769ec0481eb2eed549ea23
" With this function you can reuse the same terminal in neovim.
" You can toggle the terminal and also send a command to the same terminal.

function! toggle-term#MonkeyTerminalOpen()
  " Check if buffer exists, if not create a window and a buffer
  if !bufexists(s:monkey_terminal_buffer)
    " Creates a window call monkey_terminal
    new monkey_terminal
    " Moves to the window the right the current one
    wincmd L
    let s:monkey_terminal_job_id = termopen($SHELL, { 'detach': 1 })

     " Change the name of the buffer to "Terminal 1"
     silent file Terminal\ 1
     " Gets the id of the terminal window
     let s:monkey_terminal_window = win_getid()
     let s:monkey_terminal_buffer = bufnr('%')

    " The buffer of the terminal won't appear in the list of the buffers
    " when calling :buffers command
    set nobuflisted
  else
    if !win_gotoid(s:monkey_terminal_window)
    sp
    " Moves to the window below the current one
    wincmd L   
    buffer Terminal\ 1
     " Gets the id of the terminal window
     let s:monkey_terminal_window = win_getid()
    endif
  endif
endfunction

function! toggle-term#MonkeyTerminalToggle()
  if win_gotoid(s:monkey_terminal_window)
    call toggle-term#MonkeyTerminalClose()
  else
    call toggle-term#MonkeyTerminalOpen()
  endif
endfunction

function! toggle-term#MonkeyTerminalClose()
  if win_gotoid(s:monkey_terminal_window)
    " close the current window
    hide
  endif
endfunction

function! toggle-term#MonkeyTerminalExec(cmd)
  if !win_gotoid(s:monkey_terminal_window)
    call toggle-term#MonkeyTerminalOpen()
  endif

  " clear current input
  call jobsend(s:monkey_terminal_job_id, "clear\n")

  " run cmd
  call jobsend(s:monkey_terminal_job_id, a:cmd . "\n")
  normal! G
  wincmd p
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
