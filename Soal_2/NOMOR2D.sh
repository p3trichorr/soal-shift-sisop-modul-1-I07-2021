#!/bin/bash

echo "NOMOR 2D"
echo "Region that has the least total profit and the total profit of that region :"
awk -F "\t" ' {x[$13]+=$21}
END {for(Answer in x)
	print Answer " "x[Answer]}
' Laporan-TokoShiSop.tsv | sort -nr | tail -1 
