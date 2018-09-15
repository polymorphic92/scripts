#!/usr/bin/python3
import sys, os 
from pathlib import Path

for dir in ["repos", "scripts", "tools", "github"]:
    dir_path = Path(os.environ['HOME'] +'/'+ dir)
    dir_path.mkdir(parents=True, exist_ok=True)