#!/bin/bash
# use this script to download SRA data, give this script accesion list file as first argument

# download sequence file in compressed formate from list of run
prefetch --option-file $1

# for every SRR in the list of SRRs file, extract fastq file 
for srr in $(cat $1); do
    echo -e $"\nExtracting fastq file from accession : "$srr$Off
    fasterq-dump $srr
    sleep 2	# wait 2 second between each job submission
done