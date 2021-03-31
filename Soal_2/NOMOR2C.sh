##!/bin/bash

echo "SOAL 2C"
echo "Customer segment and The number of transaction with the least amount of transaction :"
awk -F "\t" '{if ($8 != "Segment") x[$8]++$18}
END {for(Answer in x)
	print Answer " "x[Answer]}
'  Laporan-TokoShiSop.tsv | sort -nr | head -1
