#!/bin/bash

DEST_DIR='./test_data/output'
SOURCE_DIR="./test_data/05bff4d0-71b7-401c-8b28-9966b77d4a17/05bff4d0-71b7-401c-8b28-9966b77d4a17_fits-reports"
DEST_FILE="$DEST_DIR/fits_combined_reports.xml"

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
  cat $file | grep -v '^<?xml' >> $DEST_FILE
  echo '' >> $DEST_FILE
done

# append closing docSet tag
echo '</d:docSet>' >> $DEST_FILE
