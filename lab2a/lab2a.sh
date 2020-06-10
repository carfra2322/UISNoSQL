# Create a movie rental Riak key-value store.
# bucket  = movies
# value = json with  releasedate (i.e. 2016)
#                    runningtime (i.e. 1:15)
#                    genre (i.e. comedy, drama, horror)
# key = title of the movie all together in Pascal case (TheLordOfTheRings).
# http://SERVER:PORT/riak/BUCKET/KEY



# Add 6 movies to the database from at least 2 genres (comedy, drama, horror).
# You can use imdb.com to find the information about your selected movies.
curl -v -X PUT http://riak:8098/riak/movies/ThePerksOfBeingAWallflower \
-H "Content-Type: application/json" \
-d '{"releasedate" : "2010", "runningtime" : "1h43min", "genre":"drama"}'

curl -v -X PUT http://riak:8098/riak/movies/FightClub \
-H "Content-Type: application/json" \
-d '{"releasedate" : "1999", "runningtime" : "2h19min", "genre":"drama"}'

curl -v -X PUT http://riak:8098/riak/movies/ForrestGump \
-H "Content-Type: application/json" \
-d '{"releasedate" : "1994", "runningtime" : "2h20min", "genre":"romance"}'

curl -v -X PUT http://riak:8098/riak/movies/Parasite \
-H "Content-Type: application/json" \
-d '{"releasedate" : "2019", "runningtime" : "2h12min", "genre":"thriller"}'

curl -v -X PUT http://riak:8098/riak/movies/AmericanHistoryX \
-H "Content-Type: application/json" \
-d '{"releasedate" : "1998", "runningtime" : "1h59min", "genre":"drama"}'

curl -v -X PUT http://riak:8098/riak/movies/Gladiator \
-H "Content-Type: application/json" \
-d '{"releasedate" : "2000", "runningtime" : "2h35min", "genre":"action"}'


# Delete one of the movie records.

curl -i -X DELETE http://riak:8098/riak/movies/Gladiator


# 3 branches (East, West, South).
# bucket=branches
# value = json with the name of the branch.
# Link each of the remaining five movies to at least one of the branches.
# At least one of the movies should link to two branches (i.e. that movie can be found at 2 stores).
# Come up with an intuitive riaktag such as holds.
# For example, we can lookup if a customer calls looking for a particular movie, and that movie is available at another branch.



curl -X PUT http://riak:8098/riak/branches/East \
-H "Content-Type: application/json" \
-H "Link:</riak/movies/FightClub>;riaktag=\"holds\", </riak/movies/Parasite>;riaktag=\"holds\"" \
-d '{"branchName" : "East"}'


curl -X PUT http://riak:8098/riak/branches/West \
-H "Content-Type: application/json" \
-H "Link: </riak/movies/ThePerksOfBeingAWallflower>; riaktag=\"holds\", </riak/movies/ForrestGump>; riaktag=\"holds\"" \
-d '{"branchName" : "West"}'



curl -X PUT http://riak:8098/riak/branches/South \
-H "Content-Type: application/json" \
-H "Link: </riak/movies/ThePerksOfBeingAWallflower>; riaktag=\"holds\", </riak/movies/AmericanHistoryX>; riaktag=\"holds\"" \
-d '{"branchName" : "South"}'



curl -X PUT http://riak:8098/riak/movies/ThePerksOfBeingAWallflower \
-H "Content-Type: application/json" \
-H "Link: </riak/branches/South>; riaktag=\"belongs\", </riak/branches/West>; riaktag=\"belongs\"" \
-d '{"releasedate" : "2010", "runningtime" : "1h43min", "genre":"drama"}'

curl -v -X PUT http://riak:8098/riak/movies/FightClub \
-H "Content-Type: application/json" \
-H "Link: </riak/branches/East>; riaktag=\"belongs\"" \
-d '{"releasedate" : "1999", "runningtime" : "2h19min", "genre":"drama"}'

curl -v -X PUT http://riak:8098/riak/movies/ForrestGump \
-H "Content-Type: application/json" \
-H "Link: </riak/branches/West>; riaktag=\"belongs\"" \
-d '{"releasedate" : "1994", "runningtime" : "2h20min", "genre":"romance"}'

curl -v -X PUT http://riak:8098/riak/movies/Parasite \
-H "Content-Type: application/json" \
-H "Link: </riak/branches/East>; riaktag=\"belongs\"" \
-d '{"releasedate" : "2019", "runningtime" : "2h12min", "genre":"thriller"}'

curl -v -X PUT http://riak:8098/riak/movies/AmericanHistoryX \
-H "Content-Type: application/json" \
-H "Link: </riak/branches/South>; riaktag=\"belongs\"" \
-d '{"releasedate" : "1998", "runningtime" : "1h59min", "genre":"drama"}'

# Download a picture for one of the movies and add it to a bucket named images with the key being the picture name.
# Then link it to the movie.
# Images can be found by searching Google Images and using the Advanced Search feature set to usage rights to “free to use/share”
# (so as not to violate any copyrights).
curl -X PUT http://riak:8098/riak/images/perk.jpg \
-H "Content-type: image/jpg" \
-H "Link: </riak/movies/ThePerksOfBeingAWallflower>; riaktag=\"image\"" \
--data-binary @perk.jpg


# Run queries listing all the buckets

curl -i http://riak:8098/buckets?buckets=true
# all the movies found in each branch

curl -i http://riak:8098/riak/branches/East/movies,_,_
curl -i http://riak:8098/riak/branches/West/movies,_,_
curl -i http://riak:8098/riak/branches/South/movies,_,_
# and finally of the movie with the picture and its branch.


# All the curl commands need to be tested first on your system and then saved as lab2a.sh.
# The hostname in the file should be changed to http://riak:8098/riak/
# This file and the picture used in Step 4 will be pushed to GitHub for submission.
# riak/some_bucket/some_key/<bucket>,<riaktag>,0|1

curl -i http://riak:8098/riak/images/perk.jpg/movies,_,_

