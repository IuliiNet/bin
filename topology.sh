#!/bin/sh 

FILENAME="/var/www/topology/data.txt"

batadv-vis -f json | awk '/neighbor/' |tr -d \" |tr -d \{ |tr -d \} |tr -d \, |sed 's/ router : //;s/label :/1.000 1.000/;s/neighbor : //'
batadv-vis -f json | awk '/neighbor/' |tr -d \" |tr -d \{ |tr -d \} |tr -d \, |sed 's/ router : //;s/label :/1.000 1.000/;s/neighbor : //' > $FILENAME 

echo "" >> $FILENAME
echo "" >> $FILENAME
echo "" >> $FILENAME
echo "#`date`" >> $FILENAME
