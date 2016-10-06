
_ip.system("grep -q --version")
g = _ip.magic("sc -l =grep -q --version")
g
(grep -q --version)[0]
(!grep -q --version)[0]
_ip.system("grep -q --version[0]")
g = _ip.magic("sc -l =grep -q --version;g[0]")
g = _ip.magic("sc -l =grep -q --version; print g[0]")
import sys
import os
os.system 
os.system('date')
os.system('grep -q --version')
os.system('grep -q --version')[0]
g=os.system('grep -q --version')
g.__str__ 
g.__str__()
g
os.system.__doc__
import subprocess
subprocess.call('grep')
g=subprocess.call('grep -q --version')
g=subprocess.call(['grep', '-q', '--version'])
g
g=subprocess.call(['grep', '-q', '--version'], shell=True)
subprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0]
import re
re.match.__doc__
re.match('qwer asdf zcxv', '/as/')
re.match('qwer asdf zcxv', /as/)
re.matc'as', 'h('qwer asdf zcx)
re.match('/as/', 'qwer asdf zcxv')
re.match('as', 'qwer asdf zcxv')
re.search('as', 'qwer asdf zcxv')
re.search('as', 'qwer asdf zcxv')[0]
s=re.search('as', 'qwer asdf zcxv')
s.start 
s.start()
s.group 
s.group()
s.groups()
re.sub('as''XX', 'qwer asdf zcxv')
re.sub('as''XX', 'qwer asdf zcxv')
re.sub('as', 'XX', 'qwer asdf zcxv')
g=subprocess.call(['grep', '-q', '--version'], shell=True)
g=subprocess.call(['grep', '-q', '--version'])
subprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0]
re.sub('as''XX', 'qwer asdf zcxv')

re.sub('[^\n]'
re.sub('[^\n]', '', resubprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0])
re.sub('[^\n]*([0-9+.])', '', subprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0])
re.sub('[^\n]*([0-9+.])', '', subprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0])
re.sub('[^\n]*([0-9+.]).*', '\1', subprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0])
re.sub(r'[^\n]*([0-9+.]).*', r'\1', subprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0])
re.sub(r'[^\n]*([0-9.]+).*', r'\1', subprocess.Popen(['grep', '-q', '--version'], stdout=subprocess.PIPE).communicate()[0])
