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
echo "start foreground"
echo =================
bin/elasticsearch 

#start as a deamon -d

curl localhost:9200;
