import os
import sys
import re
import graphviz

filename = "sample1.txt"

with open(filename, 'r+') as f:
    text = f.read()
    text = re.sub('human', 'cat', text)
    f.seek(0)
    f.write(text)
    f.truncate()


dot = graphviz.Digraph(comment='The Round Table')

dot.node('0', 'root')
dot.node('1', 'DebugCanvas')
dot.edge('0' , '1')
dot.node('2', 'FocusOwner')
dot.edge('0' , '2')
dot.node('3', 'Global')
dot.edge('0' , '3')
dot.node('4', 'ModManager')
dot.edge('0' , '4')
dot.node('5', 'Entry')
dot.edge('0' , '5')
dot.node('6', 'Background')
dot.edge('5' , '6')
dot.node('7', 'Header')
dot.edge('5' , '7')
dot.node('8', 'Log')
dot.edge('5' , '8')
dot.node('9', '@@3')
dot.edge('8' , '9')
dot.node('9', 'Button')
dot.edge('5' , '9')


dot.render('FileName', view=True)