# The open and close index APIs allow to close an index, and later on opening it. 
# A closed index has almost no overhead on the cluster (except for maintaining its metadata), 
# and is blocked for read/write operations. 
# A closed index can be opened which will then go through the normal recovery process.

curl -XPOST 'localhost:9200/blog/_close'

curl -XPOST 'localhost:9200/blog/_open'
