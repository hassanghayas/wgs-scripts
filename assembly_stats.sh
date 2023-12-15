#! /usr/bin/env bash

# provide the output directory as first argument where list.txt file, seqkit folder and quast_assembly_stats folder exist

output=$1
mkdir -p $output/assembly-stats
for i in $(cat $output/list2.txt); do
	tail -n +2 ${output}/seqkit/${i}.trim.seqkit.txt |awk -v OFS="\t" -F "\t" '{print $4*2,$5*2}' >> $output/assembly-stats/temp2.txt
	tail -n +2 ${output}/quast_assembly_stats/${i}/transposed_report.tsv | awk -v OFS="\t" -F "\t" '{print $14,$16,$15,$18,$17}' >>$output/assembly-stats/temp3.txt
done
paste -d "\t" $output/list2.txt $output/assembly-stats/temp2.txt $output/assembly-stats/temp3.txt | awk -v OFS="\t" -F "\t" '{print $0, $9=$3/$5}' >> $output/assembly-stats/assembly_report.txt
sed -i "1iSampleID\ttrim_reads\ttrim_bases\tcontigs_number\tcontigs_size(genome_len)\tlargest_Contig\tcontigs_N50\tGC-Content\tavg_cov\tITS1" $output/assembly-stats/assembly_report.txt
rm $output/assembly-stats/temp*

