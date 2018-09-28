#!/bin/bash

echo -e "git re init \n"
cur_dir=$PWD
for dir in $(find $1 -mindepth 1 -maxdepth 1 -type d) ; do
    cd $dir 
    if [ -d "$dir/.git" ]; then
        rm $dir/.git/hooks/*
        git init
        echo -e "can git init in $dir\n"
    else 
        echo -e "NOPE: -- $dir -- no good \n"
    fi
done
cd $cur_dir