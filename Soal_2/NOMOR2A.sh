##!/bin/bash

echo "SOAL 2A"
echo "Knowing Row ID and The Largest profit percentage :"
awk -F "\t" 'BEGIN {max=0} 
$1 !~ /"Row ID"/ {x[$1] = $21/($18-$21)*100
if(max <= x[$1]){
	max = x[$1]; name = $1}}
END {print name, max"%"}
' Laporan-TokoShiSop.tsv
