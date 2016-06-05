#!/bin/bash
echo Publishing site...
set -e

npm run cleanSite
rm -rf /tmp/co
git clone git@github.com:blackswanindustries/blackswanindustries.github.io.git /tmp/co
cd /tmp/co
cd -
npm run makeSite
rm -rf /tmp/co/*
mv -f target/www/* /tmp/co
cd /tmp/co
git add *
git commit -m "releasing site"
git push origin master
cd -
