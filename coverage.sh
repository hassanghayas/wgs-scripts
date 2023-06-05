mkdir output/coverage
for i in $(cat output/list.txt); do
    samtools coverage output/bamfiles/${i}.bam >output/coverage/${i}.tab
    awk 'FNR > 1 { print }' output/coverage/${i}.tab >>output/coverage/coverage.txt
    awk 'FNR == 1 { print }' output/coverage/${i}.tab > output/coverage/header.txt
done
paste output/list.txt output/coverage/coverage.txt >output/coverage/temp_coverage.txt
sed 's|#|seqID\t|' output/coverage/header.txt > output/coverage/temp.txt
cat output/coverage/temp.txt output/coverage/temp_coverage.txt > output/coverage/allcoverage.tab
rm output/coverage/*.txt