let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/_my-projects/b27-social-media
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +451 ~/Code/web/_my-projects/b27-social-media/__tests__/project/ProjectCreation.spec.ts
badd +1 ~/Code/web/_my-projects/b27-social-media/src/stage/stageInterfaces.ts
badd +1 ~/Code/web/_my-projects/b27-social-media/src/stage/stageSchema.ts
badd +78 ~/Code/web/_my-projects/b27-social-media/src/utils/constants.ts
badd +0 ~/Code/web/_my-projects/b27-social-media/src/stage/stageRouter.ts
argglobal
%argdel
edit ~/Code/web/_my-projects/b27-social-media/src/stage/stageRouter.ts
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
balt ~/Code/web/_my-projects/b27-social-media/src/stage/stageSchema.ts
let s:l = 1 - ((0 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/_my-projects/b27-social-media/src/utils/constants.ts", ":p")) | buffer ~/Code/web/_my-projects/b27-social-media/src/utils/constants.ts | else | edit ~/Code/web/_my-projects/b27-social-media/src/utils/constants.ts | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/_my-projects/b27-social-media/src/utils/constants.ts
endif
balt ~/Code/web/_my-projects/b27-social-media/src/stage/stageInterfaces.ts
let s:l = 54 - ((42 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 54
normal! 06|
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
