"Phil W basic vim customizations
set number "turns line numbers on you can manually do :set nonumber to turn them off temporarily
set numberwidth=3 "reserve 3 columns for the numbering
set cindent "c style indetning
set tabstop=4 "tabstops take up 4 spaces
set shiftwidth=4 "number of spaces used when indenting
set softtabstop=4 "number of spaces in tab when editing
set expandtab "tabs ARE spaces very friendly for python
ab TLA Three Letter Acronym
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,resize,tabpages,winsize,winpos
set wildmenu "Turns on a menu if you do  :e <tab>
set showmatch "matches brackets
set incsearch "start to search and show results as you type
set encoding=utf-8 "set default file encoding
set visualbell "Instead of beeping all the time cursor blinks when you make an error
set noerrorbells "obvious one
set ruler "always show position in file of cursor, often already a default
set cmdheight=2 "height of command bar at the bottom
set showcmd "show partial command in last line of the screen
filetype indent on "loads the proper indent file for the filetype
set hidden "hides buffers instead of closing them when you open a new file but have unsaved changes
set autoindent 
set smartindent
colorscheme delek
