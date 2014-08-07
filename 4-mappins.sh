# mappings

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
