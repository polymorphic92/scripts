#! /usr/bin/perl
use strict;
use File::Path;

 mkpath("$ENV{HOME}/$_") for ("repos", "scripts", "tools", "github")


