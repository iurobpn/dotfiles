skip -rfu boost::.*
skip -rfu std::.*
skip -rfu arma::.*
skip -rfu casadi::.*

set auto-load safe-path /
set history filename ~/.gdb_history
set history save on
set history size unlimited
set verbose off



define set_layout
    dashboard -output /dev/pts/$arg0
    dashboard source -style height 0

    dashboard variables -output /dev/pts/$arg1
    dashboard stack -output /dev/pts/$arg1
    dashboard threads -output /dev/pts/$arg1


    dashboard assembly -output /dev/pts/$arg2

    dashboard breakpoints -output /dev/pts/$arg3
    dashboard registers -output /dev/pts/$arg3
    dashboard expressions -output /dev/pts/$arg3
    dashboard history -output /dev/pts/$arg3
    dashboard memory -output /dev/pts/$arg3
end

define sprint
    print s$arg0
end
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
define hookpost-up
  dashboard
end

define hookpost-down
  dashboard
end

define hookpost-frame
  dashboard
end
define db
  dashboard
end
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
dashboard -enabled off
# sys.path.insert(0, '/home/gagarin/git/dotfiles/gdb/')
# import build

