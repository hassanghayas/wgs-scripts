#!/usr/bin/env bash

####################
# run this script with input directory as first argument where fastq.gz file reside and output directory as second argument
####################

ls $1 >$2/temp.txt
cat $2/temp.txt | cut -d_ -f1 | uniq >$2/list.txt
rm -rf $2/temp.txt
mkdir -p $2/trimmed_reads
for sample in $(cat $2/list.txt); do
    A=${sample}_1.fastq.gz
    B=${sample}_2.fastq.gz
    echo -e $Red"\nProcessing sample: "$sample$Off
    trimmomatic PE -threads 24 $1/$A $1/$B $2/trimmed_reads/$sample.clean_1.fastq.gz /dev/null $2/trimmed_reads/$sample.clean_2.fastq.gz /dev/null ILLUMINACLIP:$CONDA_PREFIX/share/trimmomatic/adapters/NexteraPE-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done

