# soal-shift-sisop-modul-1-I07-2021

Dibuat oleh:

Kelompok I07

Gede Yoga Arisudana (051119420000098)

Salma Rahma Lailia (05111942000016)

Zulfiqar Rahman Aji (05111942000019)



**SOAL 1

1A Show The Information From Syslog.log
In number 1A, we need to collect the information from syslog.log. The information includes, log type (INFO/ERROR), log messages, and the username on each log line.

cat syslog.log|cut -d ":" -f4

To solve the problem from number 1A, I use command cut, so I can get the information only from the fourth ":" until the next ":", because there are no other ":" after the fourth one, the information that I will get according to the syslog.log file is from ERROR/INFO until the username, and that's the exactly information that problem number 1A want to be printed

1B Show All Error Messages With The Number Of Occurrences

cat syslog.log|grep ERROR|cut -d ":" -f4|cut -d "(" -f1|sort|uniq -c

