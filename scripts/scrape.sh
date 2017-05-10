#!/bin/bash -xe
mkdir gofccyourself
cd gofccyourself
for i in $(seq 0 1000 3000); # 607000 will get you the full list, but I'll upload a torrent somewhere...
do wget "https://ecfsapi.fcc.gov/filings?limit=1000&offset=$i&proceedings.name=17-108&sort=date_disseminated,ASC" -O $i;
sleep 12;
done
cd ..
tar -cf net-neutrality-filings.tar
xz net-neutrality-filings.tar

