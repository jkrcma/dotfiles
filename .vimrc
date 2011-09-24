"""""""""""""""""""""""""""
" Dráčkovo nastavení vimu "
"""""""""""""""""""""""""""
" zvýraznění syntaxe
syntax on
" podpora pro vim příkazy v komentářích
set modeline
" zvýrazňuje hledaný řetězec
set hlsearch
" rozpoznávání typu editovaného souboru
filetype plugin indent on
" (polo)automatické ukládání
set autowrite
" potvrzování při ukončování
set confirm
" pozadí kvůli jistým terminálům
set background=light
" menu u doplňování
set wildmenu
" čísla řádků
highlight LineNr ctermfg=white cterm=NONE term=NONE

set number
" reset PAGER proměnné (používáme vim jako man viewer ;)
let $PAGER=''

" hotkeys {
	" reload configu
	nmap <Leader>s :source $MYVIMRC<CR>
	" přímá editace configu
	nmap <Leader>v :e $MYVIMRC<CR>
	" lepší navigace mezi taby
	map <C-t> :tabnew<CR> " nový tab
	map <C-right> :tabnext<CR> " další tab
	map <C-left> :tabprev<CR> " předchozí tab
	map <C-w> :q<CR> " zavřít tab
	" mezerník na zrušení aktuálního hledání
	nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
	" přepínání zobrazení čísel řádků
	nmap <C-n><C-n> :set invnumber <CR>
	" rychlé vypínání odsazovátka
	nnoremap <F8> :setl ai! cin! si!<CR>
	" explorer
	map <F11> :Explore<CR>
	" background toggle
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

" ruler {
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
	set foldenable " zapnout folding
	set foldmarker={,} " foldovat text mezi { a }
	set foldmethod=marker " foldovat na značce
	set foldminlines=7 " neflodovat co má méně jak x řádků
	set foldopen=block,hor,mark,percent,quickfix,tag " které akce otevřou foldy
" }

" vim:ts=4
