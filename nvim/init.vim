syntax on
set nowrap
set autowriteall
set exrc
set hlsearch
set noignorecase
set noerrorbells
set hidden
set smartindent
set noswapfile
set nobackup
set undodir=~/.nvim/undodir
set undofile
set incsearch
set scrolloff=10
set relativenumber number
set mouse=a
set signcolumn=yes
set colorcolumn=100 
set clipboard=unnamedplus
set title

call plug#begin()
Plug 'farmergreg/vim-lastplace'
Plug '907th/vim-auto-save'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'DingDean/wgsl.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'rhysd/vim-clang-format'
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "
set notimeout

let g:rainbow_active = 1

let g:undotree_WindowLayout = 4
nnoremap <leader>u :UndotreeToggle<CR>

set updatetime=300

colorscheme default
hi ColorColumn ctermbg=black
hi Search ctermbg=green
hi Search ctermfg=black
hi CocFloating ctermbg=black
hi Pmenu ctermbg=brown
hi Pmenu ctermfg=white

inoremap { {}<LEFT>
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

packadd termdebug

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

nnoremap <leader>f :call CocAction("format")<CR>

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Add `:Format` command to format current buffer.
" command! -nargs=0 Format :call CocActionAsync('format')
" nnoremap <leader>f :Format<CR>

nnoremap <silent> <leader>f :call <SID>format()<CR>

function! s:format()
  if (&filetype == "wgsl" || &filetype == "arduino")
		:ClangFormat
  else
		:call CocActionAsync('format')
  endif
endfunction

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
nnoremap <leader>F :Fold<CR>

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commkspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Buftabline Config
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>x :bdelete<CR>
nnoremap ; :e #<CR>

nnoremap <leader>S :so ~/dot_files/nvim/init.vim<CR>
nnoremap <leader>s :set guifont=Fira\ Code:h

nnoremap <leader>z :qa<CR>

" system clipboard
inoremap <c-V> <c-r>+
cnoremap <c-V> <c-r>+
inoremap <c-r> <c-V>

let g:neovide_cursor_vfx_mode = "wireframe"
let g:neovide_cursor_vfx_opacity=1000
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_trail_length=1.0
let g:neovide_cursor_animation_length=0.05

let g:auto_save=1

nnoremap <c-h> :wincmd h<CR>
nnoremap <c-j> :wincmd j<CR>
nnoremap <c-k> :wincmd k<CR>
nnoremap <c-l> :wincmd l<CR>

nnoremap <leader>n :nohl<CR>

nnoremap <leader>F :FZF<CR>

set guifont=Fira\ Code:h14
set termguicolors
let g:airline#extensions#tabline#enabled = 1
autocmd BufEnter * set tabstop=2 shiftwidth=2 noexpandtab

autocmd FileType wgsl setlocal commentstring=//\ %s
highlight Conceal guifg=#000000
