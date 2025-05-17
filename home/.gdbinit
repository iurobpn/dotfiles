
skip -rfu boost::.*
skip -rfu std::.*
skip -rfu arma::.*
skip -rfu casadi::.*

set auto-load safe-path /
set history filename ~/.gdb_history
set history save on
set history size unlimited
set verbose off
set print pretty on
set print array off
set print array-indexes on
set python print-stack full


python
import sys
import os
home = os.getenv("HOME")
sys.path.insert(0, '/usr/share/gcc/python')
import libstdcxx.v6.printers
# sys.path.append(home + "/.gdbinit.d")
end

define setlayout
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
# define target remote
#   target extended-remote $arg0
# end

# define target hook-extended-remote
  # source ~/.rr_gdbinit
# end

# optional: prevent gdb asking for confirmation
# when invoking the run command in gdb
set confirm off

set remotetimeout 100000

# source ~/.gdbinit.d/gdb_armadillo_printers.py
# source ~/.gdbinit.d/gdb_armadillo_to_numpy.py
# define hookpost-up
  # dashboard
# end

# define hookpost-down
  # dashboard
# end

define start-dboard
    python Dashboard.start()
    dashboard -enabled off
end
define pr
    dashboard -layout !
end
# define hookpost-pr
#   # dashboard
# end
define ps
  dashboard -layout source breakpoints stack history !threads variables
  dashboard source -style height 20
end

define pa
  dashboard -layout registers assembly memory stack
  dashboard
end

# define hookpost-pa
#   # dashboard
# end

define logout
    set logging file gdb.txt
    set logging overwrite on
    set logging redirect on
    set logging enabled on
end

define get-python-version
    python
        import sys
        print(sys.version)
    end
end

document get-python-version
    Print the version of Python embedded within this GDB.
end

define continue-breakpoint
    python gdb.post_event(lambda: gdb.execute('continue'))
end
# define hookpost-frame
  # dashboard
# end
define db
  dashboard
end
#source  ~/.gdbinit.d/dashboard.py
# source  ~/.gdbinit.d/init
# import sys
# sys.path.insert(0, '/home/gagarin/svn/python')
# python
#   from libstdcxx.v6.printers import register_libstdcxx_printers
#   register_libstdcxx_printers (None)
# end

# source ~/.gdbinit.d/dashboard

define bm
    break main
end
define dbstart
dashboard -enabled on
end

python
import sys
sys.path.insert(0, '/usr/share/gcc-9/python')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers(None)
end

source ~/.gdbdashboard

# define dbstyles
# python
# from pygments.styles import *
# for style in get_all_styles():
#   print(style)
# end
# end

dashboard -style syntax_highlighting 'gruvbox-dark'

python import sys; sys.modules['readline'] = None
# Start ------------------------------------------------------------------------
#python Dashboard.start()
dashboard -enabled off
# sys.path.insert(0, '/home/gagarin/git/dotfiles/gdb/')
# import build

ps

python print("end of .gdbinit")
