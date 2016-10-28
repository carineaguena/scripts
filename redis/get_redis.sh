#!/bin/bash
# usage get_redis.sh
# comando para buscar chaves em massa
# cat data.txt | redis-cli --pipe

echo -n "Enter key to search [ENTER]: "

read key
echo 'keys '$key | redis-cli | sed 's/^/get /' | redis-cli >> keys.txt


