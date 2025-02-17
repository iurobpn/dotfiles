import gdb.printing

class MatPrinter(gdb.ValuePrinter):
    "Print a std::string"

    def __init__(self, val):
        self.val = val

    def to_string(self):
        n_elem = self.val['n_elem']
        n_rows = self.val['n_rows']
        n_cols = self.val['n_cols']
        n_alloc = self.val['n_alloc']

        if n_alloc > 0:
            mem = self.val['mem']
        else:
            mem = self.val['mem_local']

        s = 'arma::mat<double> (n_elem: {0}, n_rows {1}), n_cols: {2}, n_alloc: {3}): { {4} }'
        s.format(n_elem, n_rows, n_cols, n_alloc, mem)

        return s


    def display_hint(self):
        return 'arma::mat<double>'


