#!/bin/bash
cd $HOME

# sed colors
export COLOR_NONE='033[0m'
export COLOR_RED='033[0;31m'
export COLOR_GREEN='033[0;32m'
export COLOR_YELLOW='033[0;33m'
export COLOR_LGREEN='033[01;32m'

export COLOR_VALUE="$COLOR_LGREEN"

function ide_now() {
	date --utc '+%F %H-%M-%S'
}

function ide_stats_morning() {
	echo "$(ide_now);$1;$2" >> ~/ego/body/stats/morning/values.csv
}

function aspects() {
	local value=$([[ -n $2 ]] && echo "$2" || echo '*')
	find . -name "$value.$1" \
		| sed -r "s#(.+)\/(\w+)\.$1#$1:\o$COLOR_VALUE\2\o$COLOR_NONE\t\1#g" \
		| sort
}

function rank() {
	aspects rank $1
}

function state() {
	aspects state $1
}

function todo() {
	aspects todo $1
}

function term() {
	aspects term $1
}

function visit() {
	aspects visit $1
}

function assign() {
	aspects assign $1
}

function advise() {
	for f in $( find . -name "*.term" ); do
		d=$(dirname $f)
		t=$(basename -s .term $f)
		
		p=9
		while [ "$f" != '.' ]
		do
			f="$(dirname $f)"
			pc=$(
				find "$f" -maxdepth 1 -name *.rank \
				| basename -s .rank "$(cat)" \
				| sort \
				| head -1
			)
			
			if [ "$pc" != "" ]; then
				if [ "$p" -gt "$pc" ]; then
					p="$pc"
				fi
			fi
		done
		
		echo -e "\033[01;32m$t:$p\033[0m\t$d"
	done | sort
}

function next() {
	f=$(
		advise \
		| head -1 \
		| sed -r "s#([^\s]+)\s+(.+)#\2#g"
	)
	
	echo $f
}