#!/bin/sh

listFile=$(find -type f ! -wholename $0 | grep -v "./.git/" | sed 's#./##')
homeCurrentUser=$(echo $HOME/)
for i in $(echo $listFile)
do
	cp -frvu $homeCurrentUser$i $i
done
