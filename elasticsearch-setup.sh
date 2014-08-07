echo =================
echo "download"
echo =================
https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz

echo =================
echo "extract"
echo =================
tar zxf elasticsearch-1.3.1.tar.gz
cd elasticsearch-1.3.1

echo
echo =================
echo "start @foreground"
echo =================
bin/elasticsearch 

#start as a deamon:
#bin/elasticsearch -d

echo
echo =================
echo "test it's alive"
echo =================
curl localhost:9200

#Expected output:
: '
{
  "status" : 200,
  "name" : "Mephisto",
  "version" : {
    "number" : "1.3.1",
    "build_hash" : "2de6dc5268c32fb49b205233c138d93aaf772015",
    "build_timestamp" : "2014-07-28T14:45:15Z",
    "build_snapshot" : false,
    "lucene_version" : "4.9"
  },
  "tagline" : "You Know, for Search"
}
'

echo
echo =================
echo "Ready to index!"
echo =================

###### CREATE ###### 

echo =================
echo "index a document - PUT"
echo =================
curl -XPUT localhost:9200/blog/posts/1 -d '{
    "title": "Introduction to Elasticsearch"
}'

echo =================
echo "index a document - POST"
echo =================
curl -XPOST localhost:9200/blog/posts/ -d '{
    "title": "Introduction to Elasticsearch part2"
}'

###### GET ###### 

echo
echo =================
echo "get the document"
echo =================
curl -XGET localhost:9200/blog/posts/1

echo
echo =================
echo "get the document - make it pretty..."
echo =================
curl -XGET localhost:9200/blog/posts/1?pretty


###### UPDATE ###### 
echo
echo =================
echo "update it"
echo =================
curl -XPOST localhost:9200/blog/posts/1/_update -d '{
  "doc": {
    "tags": ["elasticsearch", "new york"]
  }
}'

echo
echo =================
echo "get it again to see the changes"
echo =================
curl -XGET localhost:9200/blog/posts/1?pretty


###### DELETE ###### 

echo
echo =================
echo "delete the document"
echo =================
curl -XDELETE localhost:9200/blog/posts/1

echo
echo =================
echo "delete its type"
echo =================
curl -XDELETE localhost:9200/blog/posts

echo
echo =================
echo "delete its index"
echo =================
curl -XDELETE localhost:9200/blog

echo
echo =================
echo "delete everything"
echo =================
curl -XDELETE localhost:9200

###### SEARCH ###### 

echo
echo =================
echo "URI search"
echo =================
#put tags
curl -XPUT localhost:9200/blog/posts/1 -d '{
    "title": "Introduction to Elasticsearch",
    "tags": ["elasticsearch", "new york"]
}'

#TODO explain
curl localhost:9200/blog/_refresh
curl 'localhost:9200/blog/posts/_search?q=elasticsearch&pretty'


echo
echo =================
echo "JSON search"
echo =================
curl localhost:9200/_search?pretty -d '{
  "query": {
    "term": {
      "tags": "new"
    }
  }
}'

###### Analyze API  ###### 
echo
echo =================
echo "analyze API"
echo =================
curl localhost:9200/_analyze?pretty -d 'new york'


###### MAPPINGS ###### 

echo
echo =================
echo "get mapping"
echo =================
curl localhost:9200/blog/posts/_mapping?pretty

echo
echo =================
echo "update mapping and reindex"
echo =================
curl -XDELETE localhost:9200/blog/posts
curl -XPUT localhost:9200/blog/posts/_mapping -d '{
  "posts": {
    "properties": {
      "tags": {
        "type": "string",
        "index": "not_analyzed"
      }
    }
  }
}'
curl -XPUT localhost:9200/blog/posts/1 -d '{
    "title": "Introduction to Elasticsearch",
    "tags": ["elasticsearch", "new york"]
}'
curl localhost:9200/blog/_refresh
curl localhost:9200/_search?pretty -d '{
  "query": {
    "term": {
      "tags": "new york"
    }
  }
}'

###### Facets ######
echo
echo =================
echo "terms facet"
echo =================
curl -XPUT localhost:9200/blog/posts/2 -d '{
    "title": "Introduction to Hadoop",
    "tags": ["hadoop", "new york"]
}'
curl -XPOST localhost:9200/_refresh
curl localhost:9200/_search?pretty -d '{
  "facets": {
    "tags": {
      "terms": {
        "field": "tags"
      }
    }
  }
}'
