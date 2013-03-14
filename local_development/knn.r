#! /usr/bin/env Rscript
#
#
#
#
#  some code sourced from: http://stackoverflow.com/questions/14025176/finding-k-nearest-neighbor-for-only-one-point-not-an-entire-matrix-using-r
#
#
# Note: the FNN package requires all data be loaded into memory before it can run.
#       with web scale data, this is bad. see the included ./knn.py file
#       for an example of constant RAM stream processing. 
#
#       to scale this implementation as production code, we'd need to
#       split lines from standard in into batches, where each batch fits
#       in memory. the code is somewhat awkward and beyond the scope of 
#       this example.
#
#       the code that blocks streaming can be found in the FNN source code in
#       KNN_ANN.cpp lines 188-190
#       
#        	  //copy data into  matrix from a vector column by column
#	          Rvector2ANNarray(data_pts, data, n, d);
# 	        Rvector2ANNarray(query_pts, query, m, d);
#
#

require(FNN)

# config values
train_fpath      <- './data/train.tsv'
test_fpath       <- './data/test.tsv'
k                <- 3

# load training data into memory
df.train         <- read.table(train_fpath, header=F, sep='\t')

# load test data into memory
df.test          <- read.table('stdin',  header=F, sep='\t')

# separate keys and values
df.train.keys    <- df.train[,1]
df.test.keys     <- df.test[,1]

df.train.values  <- df.train[,-1]
df.test.values   <- df.test[,-1]

# run KNN
results <- knnx.index(df.train.values, df.test.values, k=k)

# push the KNN assignment results to standard out
for(i in 1:dim(results)[1]) {
  key     <- df.test.keys[i]
  nearest <- results[i,]

  cat(paste(c('R KNN:',key, '->', nearest,'\n')))
  }
