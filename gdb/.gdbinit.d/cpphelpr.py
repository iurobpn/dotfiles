class FancyLayoutCommand(gdb.Command):
    '''List the available modules in a fancy way.'''

    def __init__(self, dashboard):
        gdb.Command.__init__(self, 'dashboard -fancy-layout', gdb.COMMAND_USER)
        self.dashboard = dashboard

    def invoke(self, arg, from_tty):
        for index, module in enumerate(self.dashboard.modules, start=1):
            if module.enabled:
                brief, _, _ = module.doc.partition('\n')
                print('{}) {}\n\t{}'.format(index, module.name, brief))

FancyLayoutCommand(dashboard)
