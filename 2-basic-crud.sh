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
