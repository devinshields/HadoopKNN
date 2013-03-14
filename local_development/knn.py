#!/usr/bin/python
'''
    some code sourced from: http://stackoverflow.com/questions/12369484/searching-for-k-nearest-points
'''

import numpy
from sklearn.neighbors import NearestNeighbors
import string
import sys


class KeyedSampleRow:
  ''' encapsulates a row of randomly generated data '''
  def __init__(self, line=None):
    '''transforms a line of text into a (key, numpy.array) tuple.
       assumes the first column of a tab delimited file is an integer key
       and remaining columns are float values '''
    row        = map(string.strip, line.split('\t'))
    self.key   = int(row[0])
    self.value = numpy.array(map(float, row[1:]))
    pass
  def __str__(self):
     return  
  pass


def main ():
  ''' builds a KNN model from training data, then reads from standard in and assigns neighbors to all incoming sample rows  '''

  # config values
  train_fpath = './data/train.tsv'
  k = 3
  
  # load training data into memory, use it to build a KNN model
  training_data = [KeyedSampleRow(l) for l in open(train_fpath, 'r')]

  Train = numpy.matrix(map(lambda t: t.value, training_data))
  knn = NearestNeighbors(n_neighbors=k)
  knn.fit(Train)
  
  # stream read Test data from standard in
  # Note: this is a iterator of (key, numpy.array) tuples.
  #       it uses a small, test data scale independent amount of memory
  Test = (KeyedSampleRow(l) for l in sys.stdin)

  # online-query the KNN model
  for test_row in Test:
    nearest = knn.kneighbors(test_row.value, return_distance=False)
    
    # note: to match R indexing, +1 results
    print 'py KNN:\t{0} -> {1}'.format(test_row.key, nearest+1)

  print
  pass

if __name__ == '__main__':
  main()
