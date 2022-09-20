#!/bin/bash

for i in `ls |grep -v publications | grep -v change| grep -v batch|grep -v author|grep -v _index`;
do
cd "$i"
perl ../change-author-name.pl index.md
cd ..
done


