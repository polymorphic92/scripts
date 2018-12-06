#!/usr/bin/env python3

import json, os 

try:
  with open('config.json') as f:
      data = json.load(f)
except Exception as ex:
  print(ex)

home = os.path.expanduser('~') + '/'
cwd = os.getcwd() + '/'

for obj in data:
  full_src =  cwd  + obj["src"]
  full_des =  home + obj["des"]

  if os.path.exists(full_src) and not os.path.islink(full_des):
    if os.path.exists(full_des):
      # rename file to file.bak then delete it
      os.renames(full_des, home + 'bak/' + obj["des"] + '.bak')
     # os.unlink(full_des)
    print(full_src + ' -> ' + full_des)
    os.symlink(full_src, full_des)  




