#!/bin/bash
for ((i=0;i<23;i++))
do
wget -0 Kumpulan_$i https://loremflicker.com/320/240/kitten -a wget.log
done
