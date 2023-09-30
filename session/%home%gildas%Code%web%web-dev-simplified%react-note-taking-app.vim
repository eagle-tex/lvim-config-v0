let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/web-dev-simplified/react-note-taking-app
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 ~/Code/web/web-dev-simplified/react-note-taking-app/package.json
badd +24 ~/Code/web/web-dev-simplified/react-note-taking-app/tsconfig.json
badd +8 ~/Code/web/web-dev-simplified/react-note-taking-app/tsconfig.node.json
badd +22 ~/Code/web/web-dev-simplified/react-note-taking-app/.eslintrc.cjs
badd +3 ~/Code/web/web-dev-simplified/react-note-taking-app/src/App.css
badd +1 ~/Code/web/web-dev-simplified/react-note-taking-app/src/main.tsx
badd +1 ~/Code/web/web-dev-simplified/react-note-taking-app/vite.config.ts
badd +5 ~/Code/web/web-dev-simplified/react-note-taking-app/src/App.tsx
badd +4 ~/Code/web/web-dev-simplified/react-note-taking-app/.lintstagedrc.cjs
argglobal
%argdel
edit ~/Code/web/web-dev-simplified/react-note-taking-app/.lintstagedrc.cjs
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
wincmd =
argglobal
balt ~/Code/web/web-dev-simplified/react-note-taking-app/tsconfig.node.json
let s:l = 5 - ((4 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 02|
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/web-dev-simplified/react-note-taking-app/src/App.css", ":p")) | buffer ~/Code/web/web-dev-simplified/react-note-taking-app/src/App.css | else | edit ~/Code/web/web-dev-simplified/react-note-taking-app/src/App.css | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/web-dev-simplified/react-note-taking-app/src/App.css
endif
balt ~/Code/web/web-dev-simplified/react-note-taking-app/.eslintrc.cjs
let s:l = 1 - ((0 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
wincmd =
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
