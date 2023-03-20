mkdir -p output/quast_assembly_stats
for i in $(cat output/list.txt); do
    echo -e $Red"\nProcessing sample: "$i$Off
    quast output/assembly/${i}/contigs.fasta -o output/quast_assembly_stats/${i}
done
