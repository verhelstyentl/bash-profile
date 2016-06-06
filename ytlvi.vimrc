" is comment "
:set hlsearch
":set expandtab
:syn on
:set ts=4
:set showmode
:set ic
:set ruler
:colorscheme delek
:so .vim/plugin/fugitive.vim
:so .vim/plugin/AnsiEscPlugin.vim
:so .vim/plugin/cecutil.vim
:set t_Co=256
set laststatus=2
":set listchars=eol:$,tab:> ,trail:~,extends:>,precedes:<
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
highlight SpecialKey guifg=yellow ctermfg=yellow
highlight NonText guifg=red ctermfg=red
":set list
autocmd BufNewFile,BufRead *.install   set syntax=php
autocmd BufNewFile,BufRead *.module   set syntax=php
autocmd BufNewFile,BufRead *.inc   set syntax=php
autocmd BufNewFile,BufRead *.info  set syntax=php
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" highlights the word cursor is ion
":autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"colors statusline
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=2 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=3 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=5 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=8

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

"hi StatColor guibg=#95e454 guifg=black ctermbg=lightblue ctermfg=black
"hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

"function! MyStatusLine(mode)
"    let statusline=""
"    if a:mode == 'Enter'
"        let statusline.="%#StatColor#"
"    endif
"    let statusline.="\(%n\)\ %f\ "
"    if a:mode == 'Enter'
"        let statusline.="%*"
"    endif
"    let statusline.="%#Modified#%m"
"    if a:mode == 'Leave'
"        let statusline.="%*%r"
"    elseif a:mode == 'Enter'
"        let statusline.="%r%*"
"    endif
"    let statusline .= "\ \ %P%=%h%w\ (%l/%L,\ %c)  %y\ \ "
"    return statusline
"endfunction

"au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
"au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
"set statusline=%!MyStatusLine('Enter')

"function! InsertStatuslineColor(mode)
"  if a:mode == 'i'
"    hi StatColor guibg=orange ctermbg=lightred
"  elseif a:mode == 'r'
"    hi StatColor guibg=#e454ba ctermbg=magenta
"  elseif a:mode == 'v'
"    hi StatColor guibg=#e454ba ctermbg=magenta
"  else
"    hi StatColor guibg=red ctermbg=red
"  endif
"endfunction 

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black


