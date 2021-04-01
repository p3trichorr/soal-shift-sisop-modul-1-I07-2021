#!/bin/bash

#1A Show the information from syslog.log
echo "Show the information from syslog.log:"
cat syslog.log|grep -o '[ERROR|INFO].*'|cut -d " " -f1-

#1B Show all error messages with the number of occurrences
echo "Show all error messages with the number of occurrences:"
cat syslog.log|grep -o 'ERROR.*'|cut -d " " -f2-|cut -d "(" -f1|sort|uniq -c| sort -nr

#1C Show the number of occurrences of the error and info for each user
echo "Show the number of occurrences of the error for each user:"
cat syslog.log|grep ERROR|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
echo "Show the number of occurrences of the info for each user:"
cat syslog.log|grep INFO|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c

#1D Error Message
echo "error_message.csv have been made"
infoerror=`cat syslog.log|grep -o 'ERROR.*'|cut -d " " -f2-|cut -d "(" -f1|sort|uniq -c|sort -nr`
echo "$infoerror"|
while read checkerror
do
  totalerror=`echo $checkerror|cut -d " " -f1`
  nameerror=`echo $checkerror|cut -d " " -f2-`
  echo "$nameerror,$totalerror"
done|sed '1 i\Error,Count' > error_message.csv

#1E User Statistic
echo "user_statistic.csv have been made"
username=`cat syslog.log|cut -d "(" -f2|cut -d ")" -f1|sort|uniq`
echo "$username"|
while read user
do
  totalinfo=`cat syslog.log|grep -o "INFO.*($user)"| wc-l`
  totalerror=`cat syslog.log|grep -o "ERROR.*($user)"| wc-l`
  echo "$user,$totalinfo,$totalerror"
done|sed '1 i\Username, INFO, ERROR' > user_statistic.csv
