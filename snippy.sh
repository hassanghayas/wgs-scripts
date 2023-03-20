for sample in $(cat output/list.txt); do
    A=${sample}.clean_1.fastq.gz
    B=${sample}.clean_2.fastq.gz
    echo -e $Red"\nProcessing sample: "$sample$Off
    snippy --outdir output/alignment/${sample} --reference output/reference/EnterrococcusFaecium.gbk --R1 output/trimmed_reads/$A --R2 output/trimmed_reads/$B --cpus 16
done

