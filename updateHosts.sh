#!/bin/bash

hostsFile=/etc/hosts

{
if [[ $# -gt 0 ]];then
  cat "$@"
fi
curl -skL 'https://raw.githubusercontent.com/txthinking/google-hosts/master/scripts/hosts.all'
} |
awk -v hostsFile="$hostsFile" --posix '
BEGIN{
	while(getline < hostsFile) {
		if ( $0 ~ /^[[:space:]]*#/) {
			continue
		}
		if($2 == "localhost") {
		  localhost[++i] = $1
		} else {
		  hosts[$2] = $1
		}
	}
	close(hostsFile)
}
$0!~/^[[:space:]]*#/{
	if($1 ~ /^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[1-9])(\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])){3}$/) {
	  hosts[$2] = $1
	}
}
END{
	for(i in localhost){
	  printf("%-16s %s\n",localhost[i],"localhost") > hostsFile
	}
	for(i in hosts){
	  printf("%-16s %s\n",hosts[i],i) > hostsFile
	}
	close(hostsFile)
}
'
