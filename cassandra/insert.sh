#!/bin/bash

echo "Enter table to insert: (keyspace.table)"
read table

echo "Enter columns to insert: (column1, column2, ...)"
read column

echo "Enter values to insert: (value1, value2, ...)"
read value

cqlsh -e "INSERT INTO $table ($column) VALUES ($value);"
