##!/bin/bash

echo "SOAL 2B"
echo "List of customer names on the 2017 transaction in Albuquerque :"
awk -F "\t" '$2 ~ /2017/ {if ($10 == "Albuquerque") x[$7]}
END {for(Answer in x)
	print x[Answer]" "Answer}
' Laporan-TokoShiSop.tsv 
