"""""""""""""""""""""""""
" Dragon's vim settings "
"""""""""""""""""""""""""
" syntax highlighting
syntax on
" support vim commands in code comments block
set modeline
" highlight searched string
set hlsearch
" file type recognition
filetype plugin indent on
" (half)automatic save
set autowrite
" confirm exit of vim
set confirm
" hardcoded background setting due Konsole
set background=light
" completion menu
set wildmenu

" line numbers
highlight LineNr ctermfg=white cterm=NONE term=NONE
set number

" hotkeys {
	" .vimrc reload
	nmap <Leader>s :source $MYVIMRC<CR>
	" direct .vimrc edit
	nmap <Leader>v :e $MYVIMRC<CR>
	" better tab navigation
	map <C-t> :tabnew<CR> " nový tab
	map <C-n> :tabnext<CR> " další tab
	map <C-p> :tabprev<CR> " předchozí tab
	map <C-w> :q<CR> " zavřít tab
	" Shift+C to clear highlighted search results
	nnoremap <silent> <S-c> :nohlsearch<Bar>:echo<CR>
	" line numbers display switch
	nmap <C-l><C-l> :set invnumber <CR>
	" quick indentation switch
	nnoremap <F8> :setl ai! cin! si!<CR>
	" explorer
	map <F11> :Explore<CR>
	" background toggle (light vs. dark)
	nnoremap <F10> :call ToggleBackground()<CR>
	function! ToggleBackground()
		if &background == 'dark'
			set bg=light
			highlight CursorLine cterm=bold term=bold ctermbg=NONE
		else
			set bg=dark
			highlight CursorLine cterm=NONE term=NONE ctermbg=red
		endif
	endfunction
" }

" ruler  
	highlight RulerFileName ctermfg=red
	highlight RulerFileType ctermfg=blue
	highlight RulerColumn   ctermfg=yellow
	highlight RulerLine     ctermfg=green

	set rulerformat=%40(%#RulerFileName#%t\ %#RulerFileType#%y\ %#RulerColumn#%3c\ %#RulerLine#%l/%L\ \ %#RulerOffset#%o%)
" }

" cursor line {
	highlight CursorLine cterm=bold term=bold

	set cursorline
" }

" folding {
	set foldenable " turn on folding
	set foldmarker={,} " fold between { and }
	set foldmethod=marker " fold on marker
	set foldminlines=7 " fold only 7 lines or more
	set foldopen=block,hor,mark,percent,quickfix,tag " actions which open folds

	" fold opening and closing
	nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
	vnoremap <Space> zf
" }

" vim:ts=4

