#!/bin/bash

echo "Enter columns to select: (column1, column2, ...)"
read column

echo "Enter table to select: (keyspace.table)"
read table

cqlsh -e "SELECT $column FROM $table"
