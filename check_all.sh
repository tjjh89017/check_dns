#!/bin/bash

domain='kagehide.date'
array=( \
	'chuanchan' \
	'cindy' \
	'date' \
	'jonz' \
	'kimbelly' \
	'koi' \
	'kopa' \
	'malrey' \
	'mtbehisseste' \
	'senkaze' \
	'ted' \
	'tulpenm' \
	'wtlin' \
	'zzalice' \
)

for i in "${array[@]}"; do
	./check_dns.sh $i.$domain
	echo
done
