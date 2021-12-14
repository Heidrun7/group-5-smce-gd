import os
import sys
import re
import graphviz

dot = graphviz.Digraph(comment='DevToolResults')

dot.node('root', 'root')
dot.edge('root' , 'DebugCanvas')
dot.edge('root' , 'FocusOwner')
dot.edge('root' , 'Global')
dot.edge('root' , 'ModManager')
dot.edge('root' , 'Entry')
dot.node('DebugCanvas', 'DebugCanvas')
dot.node('FocusOwner', 'FocusOwner')
dot.node('Global', 'Global')
dot.node('ModManager', 'ModManager')
dot.node('Entry', 'Entry')
dot.edge('Entry' , 'Background')
dot.edge('Entry' , 'Header')
dot.edge('Entry' , 'Log')
dot.edge('Entry' , 'Button')
dot.node('Background', 'Background')
dot.node('Header', 'Header')
dot.node('Log', 'Log')
dot.edge('Log' , '@@3')
dot.node('@@3', '@@3')
dot.node('Button', 'Button')
dot.render('Graphviz_Dev', view=True)