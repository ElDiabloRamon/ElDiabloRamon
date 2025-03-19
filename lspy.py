#!/usr/bin/env python3

# CLI python program to list files and dirs
# By: Luke Galutia  2020/01/14

import sys, os


#with os.scandir(sys.argv[1]) as dir_entries:
#    for entry in dir_entries:
#        print(entry.stat)
#        info = entry.stat()
#        print(info.st_mtime)
        
DirDat = os.listdir(sys.argv[1])
print(DirDat)




#files_path = [os.path.abspath(x) for x in os.listdir()]
#print(files_path)