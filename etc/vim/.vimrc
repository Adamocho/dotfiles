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
	Plug 'Shougo/ddc.vim'
	Plug 'shun/ddc-vim-lsp'
	Plug 'bling/vim-bufferline'
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'
	Plug 'iamcco/markdown-preview.nvim'

call plug#end()

" MARKDOWN-PREVIEW PLUGIN OPTIONS

" Auto start. default: 0
let g:mkdp_auto_start = 0

" Auto close. default: 1
let g:mkdp_auto_close = 1

" Update when saved. default: 0
let g:mkdp_refresh_slow = 0

" Make 'MarkdownPreview command available for any file. default: 0
let g:mkdp_command_for_global = 1

" Make available to the network (127.0.0.1). default: 0
let g:mkdp_open_to_the_world = 0

" Custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
let g:mkdp_open_ip = ''

" Default browser.
let g:mkdp_browser = '/usr/bin/firefox'

" Echo url link. default: 0
let g:mkdp_echo_preview_url = 0

" Custom vim function name to open preview page.
" This function will receive url as parameter.
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" Use a custom markdown style must be absolute path.
" Like '/Users/username/markdown.css' or expand('~/markdown.css').
let g:mkdp_markdown_css = ''

" Use a custom highlight style must absolute path.
" Like '/Users/username/highlight.css' or expand('~/highlight.css').
let g:mkdp_highlight_css = ''

" Use a custom port to start server or empty for random.
let g:mkdp_port = ''

" Preview page title. ${name} will be replace with the file name.
let g:mkdp_page_title = '「${name}」'

" Recognized filetypes.
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" Set default theme (dark or light).
let g:mkdp_theme = 'dark'

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set the <leader> to the spacebar (backslash if not set).
let mapleader = " "

" <C-u> and <C-d> keep view at the center (easier to follow code).
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" Mappings for fzf-vim.
" Show buffers.
nnoremap <leader>b :Buffers<CR>

" List/Pick files (in $PWD).
nnoremap <leader>f :Files<CR>

" List git commits.
nnoremap <leader>c :Commits<CR>

" Choose from colorschemes.
nnoremap <leader>C :Colors<CR>

" Choose filetype for current buffer.
nnoremap <leader>e :Filetypes<CR>

" Normal mode mappings.
nnoremap <leader>M :Maps<CR>

" List marks.
nnoremap <leader>m :Marks<CR>

" List jumps.
nnoremap <leader>j :Jumps<CR>

" List windows - vsplit, hsplit, etc.
nnoremap <leader>w :Windows<CR>

" List GIT TAGS!
nnoremap <leader>T :Tags<CR>

" List vim tags.
nnoremap <leader>t :BTags<CR>

" Grep (ripgrep) in $PWD.
nnoremap <leader>g :Rg<CR>

" Git status.
nnoremap <leader>s :GFiles?<CR>

" Search lines in loaded buffers.
nnoremap <leader>L :Lines<CR>

" Search lines in current buffer.
nnoremap <leader>l :BLines<CR>

" Search in 'v:oldfiles' and open buffers.
nnoremap <leader>H :History<CR>

" Command history.
nnoremap <leader>h: :History:<CR>

" Search history.
nnoremap <leader>h/ :History/<CR>

" Show help tags (vimtutor pages and others).
nnoremap <leader>h? :Helptags<CR>

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
