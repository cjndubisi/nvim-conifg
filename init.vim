set tabstop=2
set shiftwidth=2
set number
set smarttab
set softtabstop=2
set mouse=a
set nocompatible
set fileencodings=utf-8
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set scrolloff=5
set expandtab
set wildmenu
set number relativenumber
set showmatch
set ignorecase
set autowriteall "auto all save when switchiing buffers
au FocusLost * :wa "auto save on focus changc

filetype plugin indent on

autocmd TermClose term://*{$SHELL} enew | bd!#

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

runtime ./plug.vim


" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

"-----------------------------
" Tabs

" Open current directory
nmap tt :tab split<CR>
nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
" nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Debugger
" nnoremap <Leader>dd :call vimspector#Launch()<CR>
" nnoremap <Leader>de :call vimspector#Reset()<CR>
" nnoremap <Leader>dc :call vimspector#Continue()<CR>

" nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
" nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

" nmap <Leader>dk <Plug>VimspectorRestart
" nmap <Leader>dh <Plug>VimspectorStepOut
" nmap <Leader>dl <Plug>VimspectorStepInto
" nmap <Leader>dj <Plug>VimspectorStepOver

nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" peitalin/vim-jsx-typescript {{{
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.mjml set filetype=html
" }}}

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula
" set background=dark " light or dark
" colorscheme onebuddy
"
"
" Clear search highlights.
map <Leader><Space> :let @/=''<CR>

"" ------ Bindings
" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

"Mode Line
nnoremap } :m .+1<CR>==
nnoremap { :m .-2<CR>==
"inoremap { <Esc>:m .-2<CR>==gi
"inoremap } <Esc>:m .+1<CR>==gi
vnoremap { :m '>+1<CR>gv=gv
vnoremap } :m '<-2<CR>gv=gv

" Flutter
" Enable Flutter menu for GUI VIm
" call FlutterMenu()

" Some of these key choices were arbitrary;
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fd :FlutterVisualDebug<cr>
nnoremap <leader>ft :Telescope flutter commands<cr>
"

let g:dartfmt_options = ['--line-length=120']
let g:lsc_auto_map=v:true
"let dart_html_in_string=v:true

let g:dart_format_on_save = 1
