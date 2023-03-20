for sample in $(cat output/list.txt); do
    A=${sample}.clean_1.fastq.gz
    B=${sample}.clean_2.fastq.gz
    echo -e $Red"\nProcessing sample: "$sample$Off
    spades.py -o output/assembly/${sample} -1 output/trimmed_reads/$A -2 output/trimmed_reads/$B --cov-cutoff auto
done

