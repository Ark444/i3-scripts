#!/usr/bin/env bash

#!/bin/bash

_key()
{
  local kp
  ESC=$'\e'
  _KEY=
  read -d '' -sn1 _KEY
  case $_KEY in
    "$ESC")
        while read -d '' -sn1 -t1 kp
        do
          _KEY=$_KEY$kp
          case $kp in
            [a-zA-NP-Z~]) break;;
          esac
        done
    ;;
  esac
  printf -v "${1:-_KEY}" "%s" "$_KEY"
}

months=(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)
month=$(expr $(date +%m) - 1)
year=$(date +%Y)

while true ; do
	last_month=$month
	cal ${months[$month]} $year
	_key x
	case $x in
		$'\e[A') year=$(expr $year + 1) ;; # UP
		$'\e[B') year=$(expr $year - 1) ;; # DOWN
		$'\e[C') month=$(expr $(expr $month + 1) % ${#months[@]}) ;; # RIGHT
		$'\e[D') month=$(expr $(expr $month - 1) % ${#months[@]}) ;; # LEFT
		*) exit ;;
	esac
done

