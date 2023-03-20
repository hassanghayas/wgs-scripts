mkdir output/coverages
ls output/bamfiles >output/coverages/list.txt
for i in $(cat output/coverages/list.txt); do
    samtools coverage output/bamfiles/${i} >output/coverages/${i}.tab
    samtools coverage -H output/bamfiles/${i} >>output/coverages/coverage.txt
done
cat output/coverages/list.txt | cut -d. -f1 >output/coverages/temp.txt
paste output/coverages/temp.txt output/coverages/coverage.txt >output/coverages/coverage.tab
rm ~/EF-analysis/output/coverages/*.txt
