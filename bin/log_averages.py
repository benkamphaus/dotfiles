#!/usr/bin/env python
import sys

def averages(sum_file, count_file):
    with open(sum_file) as sfile:
        with open(count_file) as cfile:
            counts = [int(l.split()[2]) for l in cfile.readlines()]
            sums = [int(l.split()[2]) for l in sfile.readlines()]
            return [float(sum)/count for count, sum in zip(counts, sums)]

if __name__ == "__main__":
    cfile = sys.argv[1]
    sfile = sys.argv[2]
    print(averages(sfile, cfile))
