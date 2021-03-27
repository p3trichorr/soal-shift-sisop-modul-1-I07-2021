# soal-shift-sisop-modul-1-I07-2021

Dibuat oleh:

Kelompok I07

Gede Yoga Arisudana (051119420000098)

Salma Rahma Lailia (05111942000016)

Zulfiqar Rahman Aji (05111942000019)



## PROBLEM 1

**a. Show The Information From Syslog.log**

In number 1A, we need to collect the information from syslog.log. The information includes, log type (INFO/ERROR), log messages, and the username on each log line.
```
cat syslog.log|cut -d ":" -f4
```

To solve the problem from number 1a, I use command `cut`, so I can get the information only from the third `:` until the fourth `:`, because there are no other `:` after the third one, the information that will be printed according to the syslog.log file is from the log type until the username, and that's the exactly information that problem number 1a want to be printed.

**b. Show All Error Messages With The Number Of Occurrences**

In number 1B, we need to show all the error messages with the number of occurances
```
cat syslog.log|grep ERROR|cut -d ":" -f4|cut -d "(" -f1|sort|uniq -c
```

To solve the problem from number 1b, first I will use command grep ERROR, so it will only show the line that only have ERROR text in it, next I will use command cut, so I can get the information only from the third `:` until the fourth `:`, because there are no other `:` after the third one, the information that I will get according to the `syslog.log` file is from the log type until the username, after that I will use command cut again, so I can only get the information from the 0 zero `(` until the first `(`, so then it will only printed the log type and log messages, after that I will use command `sort` so it will be sorted by alphabetical order and it will be easier to read, and lastly I will use command `uniq -c` so it will show the number of repeated log type and messages.

**c. Show The Number Of Occurrences Of The Error And Info For Each User**

In number 1C, we need to show the number of occurances of the error and info for each user
```
Error: cat syslog.log|grep ERROR|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
Info: cat syslog.log|grep INFO|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
```

To solve the problem from number 1c, I do it one by one, so the error and info for each user will be seperated, the first one is for the error, first I will use command `grep ERROR`, so it will only show the line that only have ERROR text in it, after that I will use command `cut`, so I can only get the information from the first `(` to the second `(`, but because there are no other `(`, I will get the information until the end of the line, the next thing I do is I will use command `cut` again, so I can only get the information from the zero `)` to the first `)`, I use this cut so it will only print the username not username with `)`, after that I will use command sort so it will be sorted by alphabetical order and it will be easier to read, and lastly I will use command `uniq -c` so it will show the number of repeated log type and log messages. And for the info for each user, the way I solve it is the same like for the error, the difference is only at command `grep`, for info I will use `grep INFO`, because we only want tho show the line that only have INFO text in it.

## PROBLEM 2

## PROBLEM 3

**a. Download From the given website and its log**

In number 3A, the problem wanted us to download a couple of imaga from a website and make a log out of it
```
#!/bin/bash
for (( i=1; i<=23; i++ ))
do
wget "https://loremflickr.com/320/240/cat" -O /home/zulu/Documents/Modul_1/Soal_3/Kucing/Kumpulan_$i.jpg  2>&1 | tee >> /home/zulu/Documents/Modul_1/Soal_3/Foto.log
done
```

The shell code above starts with loop that ends when there are 23 images downloaded from the web `https://loremflickr.com/320/240/cat` using the `wget` and `-O` command to write the images here `/home/zulu/Documents/Modul_1/Soal_3/Kucing` using the format `Kumpulan_$i.jpg`. The`2>&1` command indicates that the standard error `2>` is redirected to the same file descriptor that is pointed by standard output `&1`. The code was then continued with`tee >>` to write the log messages to a directory which is `/home/zulu/Documents/Modul_1/Soal_3/Foto.log`

**b. Schedule the download at a certain time**

In number 3B, the problem wants us to download the kitten images on a schdule
```
0 20 */7,*/2 * * bash /home/zulu/Documents/Modul_1/Soal_3/Kucing/soal_3a.sh | tee >> /home/zulu/Documents/Modul_1/Soal_3/Kucing/$(%d/%m/%Y).txt
```

The code starts with the date it is scheduled to run  a bash in which `0 20 */7,*/2 * *` it is for the first on every 7th and 2nd of the month at the 8th PM in the evening. the `bash` command was then written to run the `.sh` file in the `/home/zulu/Documents/Modul_1/Soal_3/Kucing/soal_3a.sh`. The `tee >>` command the writes the log messages to a directory in the `/home/zulu/Documents/Modul_1/Soal_3/Kucing/$(%d/%m/%Y).txt` with a DDMMYYY format.
