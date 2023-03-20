mkdir ~/EF-analysis/output/bamfiles
ls ~/EF-analysis/output/alignment >~/EF-analysis/output/bamfiles/temp.txt
for i in $(cat ~/EF-analysis/output/bamfiles/temp.txt); do
    cp ~/EF-analysis/output/alignment/${i}/snps.bam ~/EF-analysis/output/bamfiles/${i}.bam
done
rm ~/EF-analysis/output/bamfiles/temp.txt
