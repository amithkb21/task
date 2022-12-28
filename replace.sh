#!/bin/bash

origin="origin"
branch="dev"

#new_commit_id
new_commit_id=$(git log -n 1 --pretty=format:%H "$origin/$branch")
echo " new_commit_id: $new_commit_id"

old_commit_id=$(</var/www/html/task/file1.txt) 

echo " commit old: $old_commit_id "

#compare old and new commit id 

if [ $new_commit_id == $old_commit_id ];

	then 
		echo " NO NEW COMMIT  "
	else
		echo " FOUND  NEW COMMIT  "

		find /var/www/html/task/dev/ -name "*.env" -exec sed -i 's/APP_ENV=LOCAL/APP_ENV=DEV/g' {} \;
		find /var/www/html/task/testing/ -name "*.env" -exec sed -i 's/APP_ENV=LOCAL/APP_ENV=LOCAL/g' {} \;

		git add --all
		git commit -m " COMMIT CODE "
		
#git push origin test
#git checkout test

		git merge dev

	#backup_old_id 

	commit_save=$new_commit_id
	echo $new_commit_id > file1.txt 
	echo $commit_save

fi
