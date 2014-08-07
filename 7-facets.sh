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
