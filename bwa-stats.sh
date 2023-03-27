mkdir output/bwa-stats
ls output/bamfiles >output/bwa-stats/list.txt
for i in $(cat output/bwa-stats/list.txt); do
    samtools flagstat -O tsv output/bamfiles/${i} >output/bwa-stats/${i}.tab
#    grep
done
rm ~/EF-analysis/output/bwa-stats/list.txt
