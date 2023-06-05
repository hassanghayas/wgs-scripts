mkdir output/coverage
for i in $(cat output/list.txt); do
    samtools coverage output/bamfiles/${i}.bam >output/coverage/${i}.tab
    awk 'FNR > 1 { print }' output/coverage/${i}.tab >>output/coverage/coverage.txt
    awk 'FNR == 1 { print }' output/coverage/${i}.tab > output/coverage/header.txt
done
paste output/list.txt output/coverage/coverage.txt >output/coverage/temp_coverage.txt
sed 's|#|seqID\t|' header.txt > temp.txt
cat temp.txt temp_coverage.txt > allcoverage.tab