#!/usr/bin/env bash

if [ "$1" == "push" ]; then
	cd ~/WordPress/wplib-wordpress/
	echo "Push new version...";
	git push
	git push --tags
	exit
fi;

if [ "$1" != "" ]; then
	cd ~/WordPress/wplib-wordpress/
	if [ ! -d "../wordpress-$1" ]; then
		echo "There is no directory ${PWD%/wplib-wordpress}/wordpress-${1}.";
	else
		echo "Deleting prior version files...";
		rm *.php
		rm *.html
		rm *.txt
		rm -Rf log
		rm -Rf wp-*
		mkdir log
		git checkout master
		git reset --hard
		echo "Copying wordpress-${1}...";
		cp -r ../wordpress-$1/.  .  > log/copy.log
		git pull > log/pull.log
		git add --all . > log/add.log
		git commit -m "Updating to WordPress ${1}" >log/commit.log
		git tag -a $1 -m "Version ${1}" > log/tag.log
	fi;

fi;

