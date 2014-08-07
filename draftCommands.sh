/* Twitter River */
curl -XPUT localhost:9200/_river/frosconriver/_meta -d '
{
    "type" : "twitter",
    "twitter" : {
    	"type" : "sample",
        "oauth" : {
            "consumer_key" : "CONSUMER_KEY",
            "consumer_secret" : "CONSUMER_SECRET",
            "access_token" : "ACCESS_TOKEN",
            "access_token_secret" : "ACCESS_TOKEN_SECRET"
        },
        "filter" : {
            "tracks" : "text to track"
        }
    },
    "index" : {
        "index" : "index_name",
        "type" : "tweet",
        "bulk_size" : 1
    }
}
'

/*Index count statistics*/
curl 'localhost:9200/froscon/_count?pretty=true'
