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
echo "test it works"
echo =================
curl localhost:9200

#Expected output:
/*
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
*/


