#!/bin/bash

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
