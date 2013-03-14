#!/usr/bin/python

# make sure python listens to pipe kill cmds
import signal 
signal.signal(signal.SIGPIPE, signal.SIG_DFL) 

import random

# if you want determinism
random.seed(42)

def main():
  sample_size   = 10**3
  feature_count = 4
  
  for i in range(sample_size):
    print '\t'.join(map(str, [i] + [random.random() for j in range(feature_count)]))
    
if __name__ == '__main__':
  main()
