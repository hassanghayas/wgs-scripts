mkdir output/coverage
for i in $(cat output/list.txt); do
    samtools coverage output/bamfiles/${i}.bam >output/coverage/${i}.tab
    awk 'FNR > 1 { print }' output/coverage/${i}.tab >>output/coverage/coverage.txt
done
paste output/list.txt output/coverage/coverage.txt >output/coverage/coverage.tab
