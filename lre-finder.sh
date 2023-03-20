for sample in $(cat output/list.txt); do
    A=${sample}_1.fastq.gz
    B=${sample}_2.fastq.gz
    echo -e $Red"\nProcessing sample: "$sample$Off
    python3 ~/Applications/lre-finder/LRE-Finder.py -ipe enterococcus-fastq/$A enterococcus-fastq/$B -o output/LRE-finder/${sample} -t_db ~/Applications/lre-finder/elmDB/elm -ID 80 -1t1 -cge
done