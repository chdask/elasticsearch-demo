# Download & Start ElasticSearch

echo =================
echo "download"
echo =================
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.1.tar.gz

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

#Expected output status: 200
