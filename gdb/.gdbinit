set auto-load safe-path /
set history save
set verbose off

# add-auto-load-safe-path /path/to/my/projects/

# get around CLion/QtCreator not supporting target extended-remote
define target remote
target extended-remote $arg0
end

define target hook-extended-remote
source ~/.rr_gdbinit
end

# optional: prevent gdb asking for confirmation
# when invoking the run command in gdb
set confirm off

set remotetimeout 100000

source /home/gagarin/git/gdb_armadillo_helpers/gdb_helpers/gdb_armadillo_printers.py
source /home/gagarin/git/gdb_armadillo_helpers/gdb_helpers/gdb_armadillo_to_numpy.py

python
import sys
sys.path.insert(0, '/home/gagarin/svn/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)
end

source /home/gagarin/git/dotfiles/gdb/dashboard.py
set print pretty on
set print array off
set print array-indexes on
set python print-stack full

define bm
    break main
end


# Start ------------------------------------------------------------------------
python Dashboard.start()
# sys.path.insert(0, '/home/gagarin/git/dotfiles/gdb/')
# import build

