

for sample in $(cat ~/EF-analysis/output/bamfiles/temp.txt); do
    abricate $OUTPUT/assembly/${sample}/${sample}.fa --threads 8 --nopath --db $i >$OUTPUT/resistance_genes/ABRICATE/${sample}/${sample}_${i}.tab
done
rm ~/EF-analysis/output/bamfiles/temp.txt
