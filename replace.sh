#!/bin/bash

origin="origin"
branch="dev"
new_commit_id=$(git log -n 1 --pretty=format:%H "$origin/$branch")
echo $commit_id_latest

old_commit_id=$(<file1.txt) 

echo " commit old $old_commit_id "

if [ $new_commit_id == $old_commit_id ];

then 
	echo " NO NEW COMMIT  "
else
	echo " FOUND  NEW COMMIT  "
	
#	find /var/www/html/wl2/dev/ -name "*.env" -exec sed -i 's/LOCAL/DEV/g' {} \;
#	find /var/www/html/wl2/testing/ -name "*.env" -exec sed -i 's/LOCAL/TEST/g' {} \;
	
	git add --all
	git commit -m " COMMIT CODE "
#	git push origin test
	
#	git checkout test
	git merge dev

#testing

commit_save=$new_commit_id
echo $new_commit_id > file1.txt 
echo $commit_save

fi

