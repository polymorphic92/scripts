#!/usr/bin/env python3
import json, os 

try:
  with open('config.json') as f:
      links = json.load(f)
except Exception as ex:
  print(ex)

home = os.path.expanduser('~') + '/' 
cwd  = os.getcwd() + '/'

for link in links:
  full_src = cwd  + link["src"]
  full_des = home + link["des"]

  if os.path.exists(full_src):
    if not os.path.islink(full_des):
      print('Linking: ' + full_src + ' -> ' + full_des +':\t')
      if os.path.exists(full_des):
        print("\tFile exists renaming")
        os.renames(full_des, home + '.baks/' + link["des"] + '.bak')  # rename file to ./baks/file.bak
      os.symlink(full_src, full_des)
      print('\tSuccess!!')
    else:
      print('Already Linked:\t ' + full_src + ' -> ' + full_des)
  else:
    print(full_src + ": Does Not Exist")