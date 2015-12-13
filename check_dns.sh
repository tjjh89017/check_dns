#!/bin/bash

check() {

	local domain=$1;
	local type=$2;
	local value=$3;
	
	output=$(
		dig +nocmd "$domain" +multiline +noall +answer @ns1.he.net \
		| awk '{print $4, $5}' \
		| grep "$2 $3"
	)
	return $?
}

main(){

	array=( \
		"$1 CNAME ctf.ncu.cc" \
		"www.$1 A 140.115.50.97" \
		"www2.$1 CNAME www.$1" \
		"dns.$1 A 140.115.50.1" \
		"dns.$1 A 140.115.50.2" \
	)

	echo -e "Check *.$1"

	for i in "${array[@]}"; do
		check $i;
		if [ $? -eq 0 ]; then
			echo -en "\033[0;32m[SUCCESS]\033[0m "
		else
			echo -en "\033[0;31m[FAIL]\033[0m    "
		fi
		echo "$(echo $i | awk '{ print $1 }')"
	done
}

if [ -z "$1" ]; then
	echo -e "Usage: $0 DOMAIN"
	exit
else
	main $1
fi
