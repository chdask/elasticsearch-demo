echo
echo =================
echo "filter example"
echo =================
curl localhost:9200/_search?pretty -d '{
  "filter": {
    "term": {
      "tags": "new york"
    }
  }
}'
