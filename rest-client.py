#!/usr/bin/env python3
import requests
import json
import wget
from pprint import pprint



# url = 'https://api.github.com/repos/docker/compose/releases/latest'
# url = 'https://api.github.com/events'

# res = requests.get(url)

# print (res.json())


r = requests.get(url='https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty')
print(r.json())


# fs = wget.download(url='https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty')
# with open(fs, 'r') as f:
#     content = f.read()
# print(content)

print ("Script Complete")

