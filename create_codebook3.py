#!/usr/bin/python3
import os
import sys
import re
import time


fin = open("file_ord.txt", "r")
file_ord = fin.readlines()
fin.close()
full_tex = ""

for file in file_ord:
    if file[0] == '#':
        continue
    
    file = file.rstrip()
    
    if(file[-4:] == ".cpp" or file[-4:] == ".hpp" or file[-2:] == ".c" or file[-2:] == ".h" ):
        continue
    elif(file[-3:] == ".sh" ):
        continue
    print(file)
    beg_str = "!begin_codebook"
    end_str = "!end_codebook"


    fin = open(file, "r")
    for line in fin.readlines():
        beg_idx = line.find(beg_str)
        end_idx = line.find(end_str)
        if(beg_idx != -1):
            outputting = True
        elif(end_idx != -1):
            outputting = False
        elif(outputting):
            full_tex += line

fout = open("codebook3.tex", "w")
fout.write(full_tex)
fout.close()
