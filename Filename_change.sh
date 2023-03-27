#!/bin/bash

# run this script with fastq directory name as argument to change the name of illumina fastq files in the given directory
ls $1 > temp.txt
cat temp.txt | cut -dR -f1 | uniq >list.txt
for i in $(cat list.txt); do
	A=$(echo $i |cut -d_ -f1)
	mv $1/${i}R1_001.fastq.gz $1/${A}_1.fastq.gz
	mv $1/${i}R2_001.fastq.gz $1/${A}_2.fastq.gz
	# echo $A
done
rm *.txt
