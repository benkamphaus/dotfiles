" Don't enforace vi compatibility
set nocompatible

" Turn on pathogen
execute pathogen#infect()

" turn on line numbers.
set nu

" turn off annoying terminal beeps
set visualbell

" Set color for 256-color terminals
set t_Co=256

" set tab as 4 spaces in every case.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" show a few types of white space.
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<
set list

" use 256-color terminal ir black scheme
colorscheme Tomorrow-Night-Eighties


" allow backspacing
set backspace=indent,eol,start


" fold settings
set foldmethod=indent
set foldnestmax=3
set nofoldenable

" show when we go over 80 characters
highlight overLength ctermbg=red ctermfg=white guibg=#CD4F39
match overLength /\%81v.\+/

" turn off gui scrollbars for better mac fullscreen
set guioptions-=l
set guioptions-=r
set go-=L

" set zsh as default
set shell=/bin/zsh

" pet peaves are long strings wrapping and hovering at bottom
set nowrap
set scrolloff=8

" set font size
set guifont=Bitstream\ Vera\ Sans\ Mono:h15

" turn on ruler and cursorline
set cursorline
set ruler

" turn on syntax highlighting for mac
filetype plugin indent on
syntax on

" Make VertSplit characters less annoying
hi VertSplit ctermfg=black ctermbg=black guifg=#111111 guibg=#111111

" turn on status bars permanently and set to dark gray.
set laststatus=2

" keep background and whitespace dark
hi nontext ctermfg=black guifg=#333333
hi normal ctermbg=none guibg=#111111

" highlight searchterms
set hlsearch
hi search ctermbg=red

" highlight tweaks
hi cursorline ctermbg=black
hi statusline ctermbg=black
hi statuslinenc ctermbg=black

" fix zsh/sh/bash keyword
hi keyword ctermfg=blue guifg=#6D9CBE

" function that enables hex editing with F8
noremap <F8> :call HexMe()<CR>

let $in_hex=0
function HexMe()
  set binary
  set noeol
  if $in_hex>0
    :%!xxd -r
    let $in_hex=0
  else
    :%!xxd
    let $in_hex=1
  endif
endfunction

" Enable context specific tab completion:
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
