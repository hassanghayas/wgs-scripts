#!/usr/bin/env bash

# run resfinder from the finders conda environment
#conda activate finders

echo -e $Red"\n Running Resfinder"$Off
mkdir output/resfinder
for sample in $(cat output/list.txt); do
    A=${sample}_1.fastq.gz
    B=${sample}_2.fastq.gz
    echo -e $Red"\nProcessing sample: "$sample$Off
    run_resfinder.py -ifq enterococcus-fastq/$A enterococcus-fastq/$B -o output/resfinder/$sample -acq -c -s "Enterococcus faecium"
	cp output/resfinder/$sample/resfinder_kma/*.res output/resfinder/$sample/.
	rm -r output/resfinder/$sample/resfinder_kma
	cp output/resfinder/$sample/Resfinder_results_tab.txt output/resfinder/${sample}_resfinder.tab
done

# run plasmidfinder from the finders conda environment
echo -e $Red"\n Running plasmidfinder"$Off
mkdir output/plasmidfinder
for sample in $(cat output/list.txt); do
    A=${sample}_1.fastq.gz
    B=${sample}_2.fastq.gz
    echo -e $Red"\nProcessing sample: "$sample$Off
	mkdir output/plasmidfinder/$sample
    plasmidfinder.py -x -q -i enterococcus-fastq/$A enterococcus-fastq/$B -o output/plasmidfinder/$sample
	cp output/plasmidfinder/$sample/results_tab.tsv output/plasmidfinder/${sample}_plasmid.tab
done

# run virulencefinder from the finders conda environment
echo -e $Red"\n Running virulencefinder"$Off
mkdir output/virulencefinder
for sample in $(cat output/list.txt); do
    A=${sample}_1.fastq.gz
    B=${sample}_2.fastq.gz
    echo -e $Red"\nProcessing sample: "$sample$Off
	mkdir output/virulencefinder/$sample
    virulencefinder.py -x -i enterococcus-fastq/$A enterococcus-fastq/$B -o output/virulencefinder/$sample -p ~/virulencefinder_db/
	cp output/virulencefinder/$sample/results_tab.tsv output/virulencefinder/${sample}_virulence.tab
done