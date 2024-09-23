import gdb.printing
import arma

def build_pretty_printer():
    pp = gdb.printing.RegexpCollectionPrettyPrinter("arma")
    pp.add_printer('arma::Mat<double>', 'arma::Mat<double>', arma.MatPrinter)
    pp.add_printer('arma::Col<double>', 'arma::Col<double>', arma.MatPrinter)
    pp.add_printer('arma::Row<double>', 'arma::Row<double>', arma.MatPrinter)

    return pp


gdb.printing.register_pretty_printer(
    gdb.current_objfile(),
    build_pretty_printer())

