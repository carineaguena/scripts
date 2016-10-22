#!/bin/bash
# usage redis.sh
# comando para inserir em massa
# cat data.txt | redis-cli --pipe
for i in $(seq 100 999)
do 
printf  '*3\r\n$3\r\nSET\r\n$7\r\nname'$i'\r\n$8\r\nmaria'$i'\r\n'
done
