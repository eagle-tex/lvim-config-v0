let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +12 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/App.tsx
badd +94 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/.eslintrc.cjs
badd +18 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/createTaskForm/_TaskSelectField.tsx
badd +38 src/components/createTaskForm/CreateTaskForm.tsx
badd +33 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/taskArea/TaskArea.tsx
badd +40 src/components/taskCounter/TaskCounter.tsx
badd +16 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/taskCounter/helpers/emitCorrectBorderColor.ts
badd +4 src/components/taskCounter/helpers/emitCorrectLabel.ts
badd +17 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/Task.tsx
badd +4 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/interfaces/ITaskHeader.ts
badd +32 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/_TaskHeader.tsx
badd +3 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/interfaces/ITaskDescription.ts
badd +23 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/_TaskDescription.tsx
badd +24 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/_TaskFooter.tsx
badd +7 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/interfaces/ITaskFooter.ts
badd +9 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/interfaces/ITask.ts
badd +14 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/task/helpers/renderPriorityBorderColor.ts
badd +11 ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/package.json
argglobal
%argdel
edit src/components/taskCounter/helpers/emitCorrectLabel.ts
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
exe 'vert 1resize ' . ((&columns * 127 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 126 + 127) / 254)
argglobal
balt ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/createTaskForm/_TaskSelectField.tsx
let s:l = 15 - ((14 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 02|
wincmd w
argglobal
if bufexists(fnamemodify("src/components/taskCounter/TaskCounter.tsx", ":p")) | buffer src/components/taskCounter/TaskCounter.tsx | else | edit src/components/taskCounter/TaskCounter.tsx | endif
if &buftype ==# 'terminal'
  silent file src/components/taskCounter/TaskCounter.tsx
endif
balt ~/Code/web/homework/manik-cloudaffle/todo-app-react-ts/src/components/taskArea/TaskArea.tsx
let s:l = 5 - ((4 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 010|
wincmd w
exe 'vert 1resize ' . ((&columns * 127 + 127) / 254)
exe 'vert 2resize ' . ((&columns * 126 + 127) / 254)
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
