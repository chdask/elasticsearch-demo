# Search

TODO


echo
echo =================
echo "Search everything"
echo =================
curl -XPOST localhost:9200/_search?pretty

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


### Count 
curl 'localhost:9200/froscon/_count?pretty=true'

