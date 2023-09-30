let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/manik-cloudaffle/ts-course/todo-api
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +22 ~/Code/web/manik-cloudaffle/ts-course/todo-api/index.ts
badd +77 ~/Code/web/manik-cloudaffle/ts-course/todo-api/tsconfig.json
badd +23 ~/Code/web/manik-cloudaffle/ts-course/todo-api/package.json
badd +4 ~/Code/web/manik-cloudaffle/ts-course/todo-api/.env.development.local
badd +1 ~/Code/web/manik-cloudaffle/ts-course/todo-api/.eslintrc.cjs
badd +13 ~/Code/web/manik-cloudaffle/ts-course/todo-api/.prettierrc.cjs
badd +9 ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.entity.ts
badd +13 ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.router.ts
badd +56 ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.controller.ts
badd +15 ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.endpoints.http
badd +11 ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.validator.ts
badd +32 .eslint__rc.cjs
argglobal
%argdel
edit ~/Code/web/manik-cloudaffle/ts-course/todo-api/tsconfig.json
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
balt ~/Code/web/manik-cloudaffle/ts-course/todo-api/.eslintrc.cjs
let s:l = 77 - ((5 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 77
normal! 0125|
wincmd w
argglobal
if bufexists(fnamemodify("~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.controller.ts", ":p")) | buffer ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.controller.ts | else | edit ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.controller.ts | endif
if &buftype ==# 'terminal'
  silent file ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.controller.ts
endif
balt ~/Code/web/manik-cloudaffle/ts-course/todo-api/src/tasks/tasks.router.ts
let s:l = 34 - ((21 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 34
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
