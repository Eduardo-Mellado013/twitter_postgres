#!/bin/sh

# list all of the files that will be loaded into the database
# for the first part of this assignment, we will only load a small test zip file with ~10000 tweets
# but we will write are code so that we can easily load an arbitrary number of files
files='
test-data.zip
'

echo 'load normalized'
for file in $files; do
    python3 load_tweets.py --db postgresql://postgres:pass@localhost:6556/postgres --inputs "$file"
done

echo 'load denormalized'
for file in $files; do
    # use SQL's COPY command to load data into pg_denormalized
    # cat <JSONFILE> | sed 's/\\u0000//g' | psql <POSTGRES_DB_URL> -c "COPY <TABLENAME> (<COLUMNNAME>) FROM STDIN csv quote e'\x01' delimiter e'\x02';"
    #cat "$file" | sed 's/\\u0000//g' | psql postgresql://postgres:pass@localhost:6555 -c "COPY tweets_jsonb (data) FROM STDIN csv quote e'\x01' delimiter e'\x02';"
done
