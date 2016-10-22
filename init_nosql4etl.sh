#!/bin/bash
# usage init_nosql.sh
# comando para escolha da base de dados
# 

echo -n "Enter number database
	Key-Value (Redis)[1]
	Document (MongoDB)[2]
	Column Family (Cassandra)[3]
	Graph (Neo4j)[4] 
	[ENTER values 1-4]: "

read key

######Redis transform model###########

if [ "$key" == "1" ]; then
echo "You choose Redis!"
#testing if redis-cli is working...
teste=`echo | sed 's/^/ping /' | redis-cli`
if [ "$teste" == "PONG" ]; then

 while true
 do
 echo "Enter key parameters:"
 read parm
 
 if [ "$parm" == "stop" ]; then
  break
 else
 query=`echo 'keys '$parm | redis-cli | sed 's/^/get /' | redis-cli`
 if [ "$query" == "ERR wrong number of arguments for 'get' command" ]; then
   echo "Key not found!"
 else
  echo 'keys '$parm | redis-cli | sed 's/^/get /' | redis-cli >> keys.txt
 fi
 fi
 
 done
else
 echo "Connection error! Please look your connection redis-cli"
fi
fi

######MongoDb transform model########
if [ "$key" == "2" ]; then
echo "You choose MongoDB!"
fi


######Cassandra transform model######
if [ "$key" == "3" ]; then
echo "You choose Cassandra!"
fi

