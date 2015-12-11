#!/usr/bin/env bash

if [ "$1" != "" ]; then
	cd ~/WordPress/wplib-wordpress/
	rm *.php
	rm *.html
	rm *.txt
	rm -Rf wp-*
	if [ ! -d "../wordpress-$1" ]; then
		echo "There is no directory ${PWD%/wplib-wordpress}/wordpress-${1}.";
	else
		git checkout master
		echo "Copying wordpress-${1}...";
		cp -r ../wordpress-$1/.  .
		git add .
		git commit -m "Updating to WordPress ${1}" >commit.log
		git tag -a $1 -m "Version ${1}"
#		git push
#		git push --tags
	fi;

fi;
