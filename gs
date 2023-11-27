#!/bin/zsh

printf "Search Google Scholar"

#read input

#input=$(printf $input | sed 's/ /+/g')

curl -A 'Mozilla/5.0' "https://scholar.google.com/scholar?q=charles+butcher" | 
	sed 's/href/\n/g' | 
	grep doi |
	awk -F '"' '{print $2}' | 
	awk -F 'doi.' '{print $2}' |
	sed 's/^[a-z]*\///' |
	uniq > $XDG_CACHE_HOME/doi

while read doi; do
	curl -s "http://api.crossref.org/works/$doi/transform/application/x-bibtex" -w "\\n" |
		awk -F '{' '{print $3 $9 $11 $12}' |
		sed 's/[a-z]*=//g' |
		sed 's/\},/;/g' |
		grep -v '^\s*$' |
		awk -F ';' '{print $1 ";" $2 ";" $3 ";" $4}' >> $XDG_CACHE_HOME/hits
		#awk -F '; ([0-9]{4});' '{print $1}'
		#sed 's/;*$//'
done < $XDG_CACHE_HOME/doi

cat -n $XDG_CACHE_HOME/hits |
	awk -F: '{print $1 "\n"}'

rm $XDG_CACHE_HOME/hits


