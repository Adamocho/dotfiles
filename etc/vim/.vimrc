"
"
"      ███╗   ███╗███╗   ███╗     ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"      ████╗ ████║ ╚██╗ ██╔═╝     ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"      ██╔████╔██║  ╚████╔╝       ██║   ██║██║██╔████╔██║██████╔╝██║     
"      ██║╚██╔╝██║   ╚██╔╝        ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"      ██║ ╚═╝ ██║    ██║          ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"      ╚═╝     ╚═╝    ╚═╝           ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"

" OPTIONS ---------------------------------------------------------------- {{{

color molokai

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable playing with buffers - no saving when switching buffers.
set hidden

" Enable file type detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable and load plugins for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Add relative numbers (makes jumping between lines doable).
" But it's MEH overall ;)
" set relativenumber

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set noexpandtab

" Do not save backup files.
set nobackup

" Do not create swap files.
set noswapfile

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Wildmenu will ignore files with these extensions (no reason to open them).
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Enable spelling corrections...
set spelllang=en_gb

" ...for specific files.
autocmd FileType markdown setlocal spell

" Set thesaurus (synonyms) file (invoke using <C-X><C-T>.
set thesaurus+=/home/adam/.local/thesaurus/thesaurii.txt

" Lazyredraw for macros (boost in performance).
set lazyredraw

" }}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.vim/plugged')

	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'Shougo/ddc.vim'
	Plug 'shun/ddc-vim-lsp'
	Plug 'bling/vim-bufferline'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'

call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" <C-u> and <C-d> keep view at the center (easier to follow code).
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END

" Enable colors when available.
if (has("termguicolors"))
 set termguicolors
endif

" Enable the 'undofile' for vim 7.3 and above.
if version >= 703
	set undodir=~/.vim/backup
	set undofile
	set undoreload=10000
endif

" This will activate rust-analyzer LSP.
if executable('rust-analyzer')
	au User lsp_setup call lsp#register_server({
		\	'name': 'Rust Language Server',
		\	'cmd': {server_info->['rust-analyzer']},
		\	'whitelist': ['rust'],
		\	'initialization_options': {
		\		'cargo': {
		\			'buildScripts': {
		\				'enable': v:true,
		\			},
		\		},
		\		'procMacro': {
		\				'enable': v:true,
		\			},
		\		},
		\	})
endif


" }}}

" STATUS LINE ------------------------------------------------------------ {{{

" Clear staus line upon realoading.
set statusline=

" Left side
set statusline+=\ %F\ %M\ %Y\ %R

" Separator
set statusline+=%=

" Right side
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Set row (counting from the bottom) for the statusline to appear
set laststatus=2

" }}}
