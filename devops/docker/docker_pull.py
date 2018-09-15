#!/usr/bin/env python3
import docker, os 

client = docker.from_env()
client.login(username=os.environ['USER'] )

for image in client.images.list():
  for tag in image.tags:
    # only pull images that have the latest tag and have at least an item in RepoDigests (a registry)
    if "latest" in tag and image.attrs['RepoDigests']:
        client.images.pull(tag)
        print("pulled: "+tag)