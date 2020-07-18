#!/usr/bin/env bash

#Add your curl statements here
HOST="http://couchdb:5984"
curl $HOST

# list of DBs
curl -X GET $HOST/_all_dbs

# CREATE RESTAURANTS DB
curl -X PUT $HOST/restaurants

# CREATE RESTAURANTS
curl -i -X POST "$HOST/restaurants" -H "Content-Type: application/json" -d '{ "_id": "chick_fil_a", "name": "chick-fill-a", "food_type": ["american","chicken"], "phonenumber":"3095434534", "website":"https://chickfilla.com"}'
curl -i -X POST "$HOST/restaurants" -H "Content-Type: application/json" -d '{ "_id": "panda_express", "name": "panda express", "food_type": ["chinese","american"], "phonenumber":"309545555", "website":"https://pandaexpress.com"}'
curl -i -X POST "$HOST/restaurants" -H "Content-Type: application/json" -d '{ "_id": "el_porton", "name": "El Porton", "food_type": ["american","mexican"], "phonenumber":"3091111111", "website":"https://elporton.com"}'

#DO NOT REMOVE
curl -Ssf -X PUT http://couchdb:5984/restaurants/_design/docs -H "Content-Type: application/json" -d '{"views": {"all": {"map": "function(doc) {emit(doc._id, {rev:doc._rev, name:doc.name, food_type:doc.food_type, phonenumber:doc.phonenumber, website:doc.website})}"}}}'
curl -Ssf -X GET http://couchdb:5984/restaurants/_design/docs/_view/all
