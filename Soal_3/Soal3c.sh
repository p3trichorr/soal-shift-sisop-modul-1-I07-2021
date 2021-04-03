#!/bin/bash

a=$(date "+%--j")

let mod=$a%2

case "$mod" in
	"0")
	$(mkdir Kucing_$(date +"%d-%m-%Y"))
	b=1
	while [ $b -le 23 ]
	do
	wget -O /home/zulu/Documents/Modul_1/Soal_3/Kucing_$(date +"%d-%m-%Y")/Koleksi_$b 'http://loremflickr.com/320/240/kitten'
	b=$((b+1))
	done
	;;
	"1")
	$(mkdir Kelinci_$(date +"%d-%m-%Y"))
	b=1
	while [ $b -le 23 ]
	do
	wget -O /home/zulu/Documents/Modul_1/Soal_3/Kelinci_$(date +"%d-%m-%Y")/Koleksi_$b 'http://loremflickr.com/320/240/bunny'
	b=$((b+1))
	done
	;;
esac
