# soal-shift-sisop-modul-1-I07-2021

Dibuat oleh:

Kelompok I07

Gede Yoga Arisudana (051119420000098)

Salma Rahma Lailia (05111942000016)

Zulfiqar Rahman Aji (05111942000019)



## PROBLEM 1

**a. Show The Information From Syslog.log**

In number 1a, we need to collect the information from syslog.log. The information includes, log type (INFO/ERROR), log messages, and the username on each log line.
```
cat syslog.log|grep -o '[ERROR|INFO].*'|cut -d " " -f1-
```

To solve the problem from number 1a, I use command `grep -o`  with `[ERROR|INFO]` and `.*` so it will get every line that have ERROR or INFO text in it, after that I will use command `cut`, so I will only get the information from the 0 `" "` until the first `" "`, but since I use `-` between the `f1`, it will print the entire line not only until the first `" "`.

**b. Show All Error Messages With The Number Of Occurrences**

In number 1b, we need to show all the error messages with the number of occurances.
```
cat syslog.log|grep -o 'ERROR.*'|cut -d " " -f2-|cut -d "(" -f1|sort|uniq -c|sort -nr
```

To solve the problem from number 1b, first I will use command `grep` ERROR with `-o` and `.*` so it will only take the line with the exact ERROR text and it will take the entire line because of the `.*`, next I will use command cut, so I can get only the log message and without the log type and I also use `-` between the `f2` because I want print the entire line, after that I will use command cut again, so I can only get the information from the zero `(` until the first `(`, so then it will only printed the log type and log messages, after that I will use command `sort` so it will be sorted by alphabetical order and it will be easier to read, after that I will use command `uniq -c` so it will show the number of repeated log type and messages, lastly I will use command sort again with `-nr` so it will order by the most error message.

**c. Show The Number Of Occurrences Of The Error And Info For Each User**

In number 1c, we need to show the number of occurances of the error and info for each user.
```
Error: cat syslog.log|grep ERROR|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
Info: cat syslog.log|grep INFO|cut -d "(" -f2|cut -d ")" -f1|sort|uniq -c
```

To solve the problem from number 1c, I do it one by one, so the error and info for each user will be seperated, the first one is for the error, first I will use command `grep ERROR`, so it will only show the line that only have ERROR text in it, after that I will use command `cut`, so I can only get the information from the first `(` to the second `(`, but because there are no other `(`, I will get the information until the end of the line, the next thing I do is I will use command `cut` again, so I can only get the information from the zero `)` to the first `)`, I use this cut so it will only print the username not username with `)`, after that I will use command sort so it will be sorted by alphabetical order and it will be easier to read, and lastly I will use command `uniq -c` so it will show the number of repeated log type and log messages. And for the info for each user, the way I solve it is the same like for the error, the difference is only at command `grep`, for info I will use `grep INFO`, because we only want tho show the line that only have INFO text in it.

**d. Error Message**

In number 1d, we need to display the error message including the log message with the number of occurrences and will be sorted based on the message that have the most error in a csv file.
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

To solve the problem from number 1d, I will first declare a new variable named `infoerror` and I use it as a function to get the error message and the number of occurances like in number 1b, after that I will use command `echo` to print the result from the `infoerror`, after that I will use do while to seperate the number and the name of the message, first I will get the number of occurances first by using `cut -d " " -f1` and after that I will get the error message by using `cut -d " " -f2-`, after that I will use `echo` to print the result of the `nameerror` and `totalerror`, after using do while, the last thing to do is to use command `sed` to insert the result and choose where do I want to print the result.

**e. User Statistic**

In number 1e, we need to display the username with the number the number of occurances of the error and info for each user in a csv file.
```
echo "user_statistic.csv have been made"
username=`cat syslog.log|cut -d "(" -f2|cut -d ")" -f1|sort|uniq`
echo "$username"|
while read user
do
  totalinfo=`cat syslog.log|grep -o "INFO.*($user)"| wc-l`
  totalerror=`cat syslog.log|grep -o "ERROR.*($user)"| wc-l`
  echo "$user,$totalinfo,$totalerror"
done|sed '1 i\Username,INFO,ERROR' > user_statistic.csv
```

To solve the problem from number 1e, I will first declare a new variable named `username` to show the username that I want to display using th function in number 1c, after that I will use command `echo` to print the result from `username`, after that I will use do whilt to get the info and error for each username, first I will get the number of info for each user using command `grep -o` with `"INFO.*($user)"` so it will take the username with info text in it, after that I will use command `wc -l`, so it will count the same line if there are some repeated username and ERROR text, the same way goes for the error, the only thing that make it different is the comman `grep -o` is with `"ERROR.*($user)`, after that I will use command `echo` to print the username, info, and error, after using do while, the last thing to do is to use command `sed` to insert the result and choose where do I want to print the result.

## PROBLEM 2

**a. Knowing Row ID and the largest profit percentage**

```
##!/bin/bash

echo "SOAL 2A"
echo "Knowing Row ID and The Largest profit percentage :"
awk -F "\t" 'BEGIN {max=0} 
$1 !~ /"Row ID"/ {x[$1] = $21/($18-$21)*100
if(max <= x[$1]){
	max = x[$1]; name = $1}}
END {print name, max"%"}
' Laporan-TokoShiSop.tsv
```

We need to find Row ID  and the largest profit percentage (if the largest profit percentage is more than 1 and take the largest Row ID. We can found from this calculation ``Profit Percentage = (Profit : Cost Price) * 100`` the data shown in the Laporan-TokoShiSop.tsv

Download ``Laporan-TokoShiSop.tsv`` which is the input data, and make one folder with the code that we want to make.

To inform the field ``-F " " ``

``BEGIN {max=0}`` To can reach the maximum value.

We need to fetch the data from ``$1 !~ /"Row ID"/`` in 1 coloumn which is the Row ID Section but without the word "Row ID" on purpose we just need the value, and then calculation that formula in here ``x[$1] = $21/($18-$21)*100`` same like Row ID = Profit/Sales-Profit x 100.

Analization with this ``max = x[$1]`` for the calculation ``name = $1`` for the number of Row ID

Print the Answer with ``print name, max"%"`` The output will bring out the Row ID with their Presentage.

**b. List of customer names on the 2017 transaction in Albuquerque**

```
##!/bin/bash

echo "SOAL 2B"
echo "List of customer names on the 2017 transaction in Albuquerque :"
awk -F "\t" '$2 ~ /2017/ {if ($10 == "Albuquerque") x[$7]}
END {for(Answer in x)
	print x[Answer]" "Answer}
' Laporan-TokoShiSop.tsv 
```

We need to find list customer names in Albuquerque while doing some transaction in 2017, data shown in the Laporan-TokoShiSop.tsv

Download ``Laporan-TokoShiSop.tsv`` which is the input data, and make one folder with the code that we want to make.

To inform the field ``-F " " ``

We need to fetch the data from Order ID in column 2 ``$2 ~ /2017/`` when the early shown CA-2017 which is for the 2017 transaction.

We need to fetch the data from ``($10 == "Albuquerque")`` in 10 coloumn which is the city section, and then keep the customer name in array ``x[$7]``

Print the Answer with ``Print Answer" "x[Answer]`` The output will bring out the Customer name.

**c. Customer segment and The number of transactions with the least amount of transactions**

```
##!/bin/bash

echo "SOAL 2C"
echo "Customer segment and The number of transaction with the least amount of transaction :"
awk -F "\t" '{if ($8 != "Segment") x[$8]++$18}
END {for(Answer in x)
	print Answer " "x[Answer]}
'  Laporan-TokoShiSop.tsv | sort -nr | head -1
```

We need to find the segment has the least amount of transactions that shown in the Laporan-TokoShiSop.tsv

Download ``Laporan-TokoShiSop.tsv`` which is the input data, and make one folder with the code that we want to make.

To inform the field ``-F " " ``

We need to calculate all the row of our segment column, except column one "Segment" which is the head of the coloumn so we need to write ``if ($8 != "Segment")`` on purpose "Segment 0" cannot be calculated.

We count with this calculation ``{x[$8]++$18}`` to fetch from the column 8 is Segment and column 18 is the Sales. and then ``END {for(Answer in x)`` 

Dont forget use ``sort -nr`` to sort the data from biggest to least data, and ``head -1`` to choose one of the least data.

Print the Answer with ``Print Answer" "x[Answer]`` The output will bring out the least total amount and the segment.

**d. Region that has the least total profit and The total profit of that region**

```
#!/bin/bash

echo "NOMOR 2D"
echo "Region that has the least total profit and the total profit of that region :"
awk -F "\t" ' {x[$13]+=$21}
END {for(Answer in x)
	print Answer " "x[Answer]}
' Laporan-TokoShiSop.tsv | sort -nr | tail -1 
```

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
for((i=0;i<23;i=i+1))
do
	let numb=$i+1
	wget -a Foto.log -O Koleksi_$numb 'https://loremflickr.com/320/240/kitten'
	test[$i]="$(md5sum Koleksi_$numb | awk '{print $1;}')"
	for((compare=i-1;compare>=0;compare=compare-1))
	do
		if [[ "${test[$i]}" == "${test[$compare]}" ]];
		then
			rm  Koleksi_$numb
			numb=$((numb-1))
		fi
	done
done
```

The shell code above starts with a loop that ends at the 23rd image, and the `let numb=$i+1` is to start the count for the number at 1. `wget` and the link at the end is a command to get the images form the website, while `-a` before the Foto.log is to direct the logs into the Foto.log folder and `-O` command is to name the images with that format. The `test[$i]="$(md5sum Koleksi_$numb | awk '{print $1;}')"`line is to create a test by taking the iamge 

**b. Schedule the download at a certain time**

In number 3B, the problem wants us to download the kitten images on a schdule
```
0 20 */7,*/2 * * bash /home/zulu/Documents/Modul_1/Soal_3/Kucing/soal_3a.sh | tee >> /home/zulu/Documents/Modul_1/Soal_3/Kucing/$(%d/%m/%Y).txt
```

The code starts with the date it is scheduled to run  a bash in which `0 20 */7,*/2 * *` it is for the first on every 7th and 2nd of the month at the 8th PM in the evening. the `bash` command was then written to run the `.sh` file in the `/home/zulu/Documents/Modul_1/Soal_3/Kucing/soal_3a.sh`. The `tee >>` command the writes the log messages to a directory in the `/home/zulu/Documents/Modul_1/Soal_3/Kucing/$(%d/%m/%Y).txt` with a DDMMYYY format.
