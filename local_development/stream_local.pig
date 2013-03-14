
-- reference the test data on disk
rows = LOAD './data/test.tsv';

-- stream the test data through python
python_mapped_rows = STREAM rows THROUGH `knn.py`;
STORE python_mapped_rows INTO './data/results/python_mapped_rows';

-- stream the test data through R
r_mapped_rows = STREAM rows THROUGH `knn.r`;
STORE r_mapped_rows INTO './data/results/r_mapped_rows';
