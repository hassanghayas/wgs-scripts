for sample in $(cat output/list.txt); do
    echo -e $Red"\nProcessing sample: "$sample$Off
    prokka --outdir output/annotation/${sample} --prefix ${sample} --proteins output/reference/EnterrococcusFaecium.gbk --cpus 0 output/assembly/${sample}/contigs.fasta --locustag $sample
done
