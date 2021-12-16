#!/bin/sh

sudo apt update -y && sudo apt upgrade -y

sudo apt install -y tree \
                    screen \
                    tmux \
                    wget \
                    ripgrep

# vimrc settings
echo "
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set visualbell
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
syntax enable
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
hi Search ctermfg=black ctermbg=white
" > ~/.vimrc

# tmux conf settings
echo "
set-option -g default-shell /bin/zsh
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'
set -g prefix C-q
unbind C-b
set-option -g status-position top
set-option -g status-left-length 90
set-option -g status-right-length 90
set-option -g status-left '#H:[#P]'
set-option -g status-right '#(wifi) #(battery --tmux) [%Y-%m-%d(%a) %H:%M]'
set-option -g status-interval 1
set-option -g status-justify centre
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind -r H resize-pane -L 5
bind -r J resize-pane -D 5
bind -r K resize-pane -U 5
bind -r L resize-pane -R 5
bind - split-window -v
set-option -g base-index 1
set-option -g mouse on
setw -g mode-keys vi
bind -T copy-mode-vi v send -X begin-selection
bind -T copy-mode-vi V send -X select-line
bind -T copy-mode-vi C-v send -X rectangle-toggle
bind -T copy-mode-vi y send -X copy-selection
bind -T copy-mode-vi Y send -X copy-line
bind-key C-p paste-buffer
" > tmux.conf