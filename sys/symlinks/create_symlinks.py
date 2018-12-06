#!/usr/bin/env python3
import json, os 

try:
  with open('config.json') as f:
      links = json.load(f)
except Exception as ex:
  print(ex)

for link in links:
  full_src =  os.getcwd() + '/'  + link["src"]
  full_des =  os.path.expanduser('~') + '/' + link["des"]

  if os.path.exists(full_src) and not os.path.islink(full_des):
    if os.path.exists(full_des):
      os.renames(full_des, home + '.baks/' + link["des"] + '.bak')  # rename file to ./baks/file.bak then delete it
    print(full_src + ' -> ' + full_des)
    os.symlink(full_src, full_des)