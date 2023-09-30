let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/reed-barger/react-bootcamp/react-social-media-v0
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/index3.js
badd +1 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/index.js
badd +13 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/App.jsx
badd +1 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Login.jsx
badd +1 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Header.jsx
badd +6 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/CreatePost.jsx
badd +4 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/PostList.jsx
badd +1 ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Post.jsx
badd +33 package.json
badd +18 ~/Code/web/reed-barger/react-bootcamp/react-social-media/.prettierrc
badd +30 ~/Code/web/reed-barger/react-bootcamp/react-social-media/.eslintrc
argglobal
%argdel
edit ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Login.jsx
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
exe 'vert 1resize ' . ((&columns * 91 + 91) / 183)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 183)
argglobal
balt ~/Code/web/reed-barger/react-bootcamp/react-social-media/.prettierrc
let s:l = 13 - ((12 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 09|
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Post.jsx", ":p")) | buffer ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Post.jsx | else | edit ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Post.jsx | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Post.jsx
endif
balt ~/Code/web/reed-barger/react-bootcamp/react-social-media/src/components/Header.jsx
let s:l = 1 - ((0 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 06|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 91 + 91) / 183)
exe 'vert 2resize ' . ((&columns * 91 + 91) / 183)
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
