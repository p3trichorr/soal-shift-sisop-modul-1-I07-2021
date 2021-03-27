# soal-shift-sisop-modul-1-I07-2021

Dibuat oleh:

Kelompok I07

Gede Yoga Arisudana (051119420000098)

Salma Rahma Lailia (05111942000016)

Zulfiqar Rahman Aji (05111942000019)



## SOAL 1

**a. Show The Information From Syslog.log**

In number 1a, we need to collect the information from syslog.log. The information includes, log type (INFO/ERROR), log messages, and the username on each log line.
```
cat syslog.log|cut -d ":" -f4
```

To solve the problem from number 1a, I use command `cut`, so I can get the information only from the third `:` until the fourth `:`, because there are no other `:` after the third one, the information that will be printed according to the syslog.log file is from the log type until the username, and that's the exactly information that problem number 1a want to be printed.

**b. Show All Error Messages With The Number Of Occurrences**

In number 1b, we need to show all the error messages with the number of occurances
```
cat syslog.log|grep -o 'ERROR.*'|cut -d " " -f2-|cut -d "(" -f1|sort|uniq -c|sort -nr
```

To solve the problem from number 1b, first I will use command grep ERROR with `-o` and `.*` so it will only take the line with the exact ERROR text and it will take the entire line because of the `.*`, next I will use command cut, so I can get only the log message and without the log type and I also use `-` between the `f2` because I want print the entire line, after that I will use command cut again, so I can only get the information from the zero `(` until the first `(`, so then it will only printed the log type and log messages, after that I will use command `sort` so it will be sorted by alphabetical order and it will be easier to read, after that I will use command `uniq -c` so it will show the number of repeated log type and messages, lastly I will use command sort again with `-nr` so it will order by the most error message.

**c. Show The Number Of Occurrences Of The Error And Info For Each User**

In number 1c, we need to show the number of occurances of the error and info for each user
```
Error: cat syslog.log|grep ERROR|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
Info: cat syslog.log|grep INFO|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
```

To solve the problem from number 1c, I do it one by one, so the error and info for each user will be seperated, the first one is for the error, first I will use command `grep ERROR`, so it will only show the line that only have ERROR text in it, after that I will use command `cut`, so I can only get the information from the first `(` to the second `(`, but because there are no other `(`, I will get the information until the end of the line, the next thing I do is I will use command `cut` again, so I can only get the information from the zero `)` to the first `)`, I use this cut so it will only print the username not username with `)`, after that I will use command sort so it will be sorted by alphabetical order and it will be easier to read, and lastly I will use command `uniq -c` so it will show the number of repeated log type and log messages. And for the info for each user, the way I solve it is the same like for the error, the difference is only at command `grep`, for info I will use `grep INFO`, because we only want tho show the line that only have INFO text in it.

**d. Error Message**

In number 1d, we need to display the error message including the log message with the number of occurrences and will be sorted based on the message that have the most error
```
infoerror:`cat syslog.log|grep -o 'ERROR.*'|cut -d " " -f2-|cut -d "(" -f1|sort|uniq -c|sort -nr`
echo "$infoerror"|
while read checkerror
do
  totalerror=`echo $checkerror|cut -d " " -f1`
  nameerror=`echo $checkerror|cut -d " " -f2-`
  echo "$nameerror,$totalerror"
done|sed '1 i\Error,Count' > error_message.csv
```

To solve the problem from number 1d, I will first declare a new variable named `infoerror` and I use it as a function to get the error message and the number of occurances like in number 1b, after that I will use `echo` to print the result from the `infoerror`, after that I will use do while to seperate the number and the name of the message, first I will get the number of occurances first by using `cut -d " " -f1` and after that I will get the error message by using `cut -d " " -f2-`, after that I will use `echo` to print the result of the `nameerror` and `totalerror`, after using do while, the last thing to do is to use command `sed` to insert the result and choose where do I want to print the result.

## SOAL 2

**D. Region that has the least total profit and The total profit of that region**

We need to find the region that has the least total profit that shown in the Laporan-TokoShiSop.tsv

Download ``Laporan-TokoShiSop.tsv`` which is the input data, and make one folder with the code that we want to make.

To inform the field ``-F " " ``

We need to calculate ``{x[$13]+=$21}`` to fetch from 13 coloumn which is the region section, and then all the region that we want to count the profit ``END {for(Answer in x)``

Dont forget use ``sort -nr`` to sort the data from biggest to least data, and ``tail -1`` to choose one of the least data.

Print the Answer with ``Print Answer" "x[Answer]`` The output will bring out the least total profit & the region.

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
