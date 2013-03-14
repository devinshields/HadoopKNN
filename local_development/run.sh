#!/bin/bash
#
#
#




# makes 'pig_local' into a shell command
shopt -s expand_aliases
alias pig_local='java -Xmx4096m -cp ../lib/jars/pig-0.10.0.jar org.apache.pig.Main -x local'

# clean up directories from any prior runs
rm -rf ./data; mkdir ./data



# randomly generate training and test data
./simulate.py | head -20  > ./data/train.tsv
./simulate.py | tail -200 > ./data/test.tsv

# local testing via bash piping:
cat ./data/test.tsv | ./knn.py > ./results/python_bash_pipe_KNN_assignments.txt
cat ./data/test.tsv | ./knn.r  > ./results/R_bash_pipe_KNN_assignments.txt

# test pig streaming locally
pig_local ./stream_local.pig
