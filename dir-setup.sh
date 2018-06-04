#!/usr/bin/env bash

# home_dir="/home/$USER/code" #users home/code  
home_dir="~/code" #users home/code  

#dirs that need to be created
declare -a dir_tree=( 
           "$home_dir/repos/github"
           "$home_dir/repos/sandbox"
           "$home_dir/repos/work"
           "$home_dir/scripts/work"
           "$home_dir/scripts/personal"
)

echo "home dir: $home_dir"
# printf "Creating ${#dir_tree[@]} dirs \n\n"

for dir in "${dir_tree[@]}"
do
   if [ ! -d "$dir" ]; #create dir if it does not exist 
   then
     echo "The dir: $dir does not exist"
    #  mkdir -p $dir
   else
     echo "The dir: $dir already exist"

   fi
done