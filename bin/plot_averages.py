#!/usr/bin/env python
import sys
from matplotlib import pyplot as plt
import numpy as np

def averages(sum_file, count_file):
    with open(sum_file) as sfile:
        with open(count_file) as cfile:
            counts = [int(l.split()[2]) for l in cfile.readlines()]
            sums = [int(l.split()[2]) for l in sfile.readlines()]
            return [float(sum)/count for count, sum in zip(counts, sums)]


def parse_values(infile):
    return np.array([int(l.split()[2]) for l in infile.readlines()])

if __name__ == "__main__":
    cfile = sys.argv[1]
    sfile = sys.argv[2]
    avgs = averages(sfile, cfile)
    plt.plot(avgs)
    plt.show()


fig, ax1 = plt.subplots()
ind = np.arange(len(rets))
ax1.plot(ind, rets, 'b-')
ax1.set_xlabel('time (minutes after start)')
# Make the y-axis label and tick labels match the line color.
ax1.set_ylabel('retractions', color='b')
for tl in ax1.get_yticklabels():
    tl.set_color('b')

ax2 = ax1.twinx()
ax2.plot(ind, avgs, 'r-')
ax2.set_ylabel('average transaction time', color="red")
for tl in ax2.get_yticklabels():
    tl.set_color('r')
plt.show()
