let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/playground/neovim-ide-test
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +7 .eslintrc.cjs
badd +1 .lintstagedrc.cjs
badd +22 .prettierrc.cjs
badd +1 index.html
badd +1 postcss.config.js
badd +1 tsconfig.json
badd +31 src/files/test.py
badd +10 src/files/some-text-file.txt
badd +3 src/files/toDebug.ts
badd +30 src/files/script.js
argglobal
%argdel
edit tsconfig.json
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 126 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 127 + 127) / 254)
argglobal
balt src/files/test.py
let s:l = 52 - ((25 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 52
normal! 019|
lcd ~/Code/web/playground/neovim-ide-test
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts", ":p")) | buffer ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts | else | edit ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/playground/neovim-ide-test/src/files/toDebug.ts
endif
balt ~/Code/web/playground/neovim-ide-test/src/files/script.js
let s:l = 3 - ((2 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 017|
lcd ~/Code/web/playground/neovim-ide-test
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 126 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 127 + 127) / 254)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
