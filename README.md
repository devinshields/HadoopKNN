HadoopKNN
=========

A web-scale feature imputation tool for finding K-Nearest Neighbors in a training set

## Project lead

* Devin Shields ([@devin1shields](http://twitter.com/devin1shields))

## Purpose

To demonstrate a scalable statistical algorithm in the Hadoop environment.
To highlight the 'gotchas' of moving from local development to distributed computing.

## Problem Statement

Suppose you have access to cheap data (e.g. web traffic) for a large population and more useful (but expensive) data about a small subset of the population (e.g. loan default likelihood). Assuming good correlation between the cheap and expensive data and sufficient training data, you should be able to make inferences about any member of the population by looking at the neighborhood of a sample.

Find a formal discussion of value imputation here:
  http://www.fs.fed.us/rm/pubs_other/rmrs_2008_crookston_n001.pdf

This code demonstrates how to find the k-nearest neighbors of each member of a test set. All assigned neighbors are members of a training set.

## Where To Start

The 'run.sh' bash script is a good place to start.

If you have difficulties understanding the script, a good bash reference is available here:
  http://www.tldp.org/LDP/abs/abs-guide.pdf

## Required Tools

This code requires:

* Java
* R
* R's FFN package
* python
* python's numpy, scipy and scikit-learn packages
* bash

Please use a *nix environment
