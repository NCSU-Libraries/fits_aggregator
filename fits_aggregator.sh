#!/bin/bash

# get source directory from arguments
SOURCE_DIR=$1

# get destination file path from arguments
DEST_FILE=$2

#initialize output file with xml declaration
echo '<?xml version="1.0" encoding="UTF-8"?>' > $DEST_FILE

# append opening docSet tag
echo '<d:docSet' >> $DEST_FILE
echo 'xmlns:d="http://lib.ncsu.edu/schema/doc_set"' >> $DEST_FILE
echo 'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' >> $DEST_FILE
echo 'xsi:schemaLocation="http://lib.ncsu.edu/schema/doc_set https://raw.githubusercontent.com/NCSU-Libraries/doc_set_schema/master/doc_set.xsd">' >> $DEST_FILE
echo '' >> $DEST_FILE

# for each file in source directory,
# write contents to $DEST_FILE, excluding xml declaration
for file in $SOURCE_DIR/*
do

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ $line != '<?xml'* ]]
    then
      echo $line >> $DEST_FILE
    fi
  done < "$file"

done

# append closing docSet tag
echo '</d:docSet>' >> $DEST_FILE
