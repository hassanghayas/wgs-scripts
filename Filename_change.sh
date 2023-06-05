#!/bin/bash

# run this script with fastq directory name as argument to change the name of illumina fastq files in the given directory

for i in $(ls $1 | cut -dR -f1 | uniq); do
	A=$(echo $i |cut -d_ -f1)
	mv $1/${i}R1_001.fastq.gz $1/${A}_1.fastq.gz
	mv $1/${i}R2_001.fastq.gz $1/${A}_2.fastq.gz
	# echo $A
done
