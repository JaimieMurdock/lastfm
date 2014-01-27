#/bin/sh
MYSQL='mysql -u root -p crawler_lastfm'

#$MYSQL < raw-schema.sql
$MYSQL < 01-columns.sql
$MYSQL < 02-lists.sql
$MYSQL < 03-annotations.sql
$MYSQL < 04-scrobbles.sql
