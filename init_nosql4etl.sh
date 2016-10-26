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
 echo "Enter key parameters: [type: stop+ENTER when you finish]"
 read parm
 
 if [ "$parm" == "stop" ]; then
  echo "Bye!"
  break
 else
 query=`echo 'keys '$parm | redis-cli | sed 's/^/get /' | redis-cli`
 if [ "$query" == "ERR wrong number of arguments for 'get' command" ]; then
   echo "Key not found!"
 else
   #when stop search keys the key_values file is generate
   echo $parm $query >> key_values
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
#testing if cassandra -f is working...
cqlsh -e "select key, host_id, listen_address from system.local;"
fi

if [ "$key" == "4" ]; then
echo "You choose Neo4J!"

fi
