import gdb

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

        s = '{n_elem: ' + str(n_elem) + ', n_rows ' + str(n_rows) + ', n_cols: ' + str(n_cols) + ', n_alloc: ' + str(n_alloc) + '}'

        return s


    def children(self):
        n_elem = self.val['n_elem']
        # n_rows = self.val['n_rows']
        # n_cols = self.val['n_cols']
        n_alloc = self.val['n_alloc']

        if n_alloc > 0:
            mem = self.val['mem']
        else:
            mem = self.val['mem_local']

        for i in range(n_elem):
            yield ('{0}'.format(i), mem[i])


    def display_hint(self):
        return 'array'


