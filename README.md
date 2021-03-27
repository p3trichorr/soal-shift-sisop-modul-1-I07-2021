# soal-shift-sisop-modul-1-I07-2021

Dibuat oleh:

Kelompok I07

Gede Yoga Arisudana (051119420000098)

Salma Rahma Lailia (05111942000016)

Zulfiqar Rahman Aji (05111942000019)



## SOAL 1

**a. Show The Information From Syslog.log**
In number 1A, we need to collect the information from syslog.log. The information includes, log type (INFO/ERROR), log messages, and the username on each log line.
```
cat syslog.log|cut -d ":" -f4
```

To solve the problem from number 1a, I use command `cut`, so I can get the information only from the third `:` until the fourth `:`, because there are no other `:` after the third one, the information that will be printed according to the syslog.log file is from the log type until the username, and that's the exactly information that problem number 1a want to be printed.

**b. Show All Error Messages With The Number Of Occurrences**
```
cat syslog.log|grep ERROR|cut -d ":" -f4|cut -d "(" -f1|sort|uniq -c
```

To solve the problem from number 1b, first I will use command grep ERROR, so it will only show the line that only have ERROR text in it, next I will use command cut, so I can get the information only from the third `:` until the fourth `:`, because there are no other `:` after the third one, the information that I will get according to the `syslog.log` file is from the log type until the username, after that I will use command cut again, so I can only get the information from the 0 zero `(` until the first `(`, so then it will only printed the log type and log messages, after that I will use command `sort` so it will be sorted by alphabetical order and it will be easier to read, and lastly I will use command `uniq -c` so it will show the number of repeated log type and messages.

**c. Show The Number Of Occurrences Of The Error And Info For Each User**
```
Error: cat syslog.log|grep ERROR|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
Info: cat syslog.log|grep INFO|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
```

To solve the problem from number 1c, I do it one by one, so the error and info for each user will be seperated, the first one is for the error, first I will use command `grep ERROR`, so it will only show the line that only have ERROR text in it, after that I will use command `cut`, so I can only get the information from the first `(` to the second `(`, but because there are no other `(`, I will get the information until the end of the line, the next thing I do is I will use command `cut` again, so I can only get the information from the zero `)` to the first `)`, I use this cut so it will only print the username not username with `)`, after that I will use command sort so it will be sorted by alphabetical order and it will be easier to read, and lastly I will use command `uniq -c` so it will show the number of repeated log type and log messages. And for the info for each user, the way I solve it is the same like for the error, the difference is only at command `grep`, because we only want tho show the line that only have INFO text in it.
