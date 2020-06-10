#Load the data into Riak 
./lab2b/load_data.erl ./lab2b/goog.csv

#Return the entire data set
curl -vSsf -X POST http://riak:8098/mapred -H 'Content-Type: application/json' -d \
'{"inputs":"goog",
"query":[{"map":{"language":"javascript",
"name":"Riak.mapValuesJson",
"keep":true}}]}'


