#!/usr/bin/env fish

# zellij action gdbdashboard "gdb -ex 'dashboard -output /dev/null' -ex 'dashboard source -style height 50' -ex 'dashboard source -style width 50' -ex 'dashboard source -style context 3' -ex 'dashboard source -style locals 3' -ex 'dashboard source -style threads 3' -ex 'dashboard source -style assembly 3' -ex 'dashboard source -style history 3' -ex 'dashboard source -style breakpoints 3' -ex 'dashboard source -style memory 3' -ex 'dashboard source -style registers 3' -ex 'dashboard source -style source 3' -ex 'dashboard source -style variables

zellij action new-tab -l ~/git/dotfiles/gdblayout.yml

tty
zellij action focus-next-pane
tty
zellij action focus-next-pane
tty
zellij action focus-next-pane
tty
