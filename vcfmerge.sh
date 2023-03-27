# Activate conda alignment environment for merge_vcf

conda activate alignment

# do indexing using tabix do all together using parallel command

parallel tabix -p vcf ::: *.vcf.gz

# combind the vcf using bcftools merge command

bcftools merge -o merged.vcf.gz -0 *.vcf.gz

## There is one problem with this scirpt the merged vcf wont open so you can try the trick below
## open the merged_vcfs.vcf.gz with nano using the command

nano merged.vcf.gz > merged_vcf.csv

## this will open this in the text editor, you can now save it as .csv file and it will now be avaialable as a excel file

#bam file indexing
parallel samtools index ::: *.bam