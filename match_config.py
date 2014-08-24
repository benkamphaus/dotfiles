#!/usr/local/bin/python
from os.path import expanduser, sep, dirname, basename
from glob import glob
from shutil import copy

# Get paths and files.
this_dir = dirname(__file__)
dotfiles = glob(this_dir + sep + ".*")
homedir = expanduser("~")

# Get list of src files and copy them to dotfiles directory.
src_files = [homedir + sep + basename(dotfile) for dotfile in dotfiles]
for src_file in src_files:
    try:
        copy(src_file, this_dir + sep + basename(src_file))
    except IOError:
        print("Skipping " + src_file + " b/c it's either a dir or not present.")
