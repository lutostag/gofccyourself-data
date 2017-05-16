#!/bin/bash

for i in $(ls -1 [0-9]*);
  do jq -cM '.filings[] | del(._index)' $i | ./bulkify.py $i > current &&
  curl -u elastic:changeme -s -H "Content-Type: application/x-ndjson" -XPOST localhost:9200/fcc/create/_bulk --data-binary "@current"
done;
