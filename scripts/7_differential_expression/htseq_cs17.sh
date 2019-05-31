#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J diff_expression_htseq
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

# Load modules
module load bioinfo-tools
module load htseq

htseq-count -f bam -s no -t gene -i ID /home/stellab/private/genome_analysis/results/7_differential_expression/cs17_forelimb/accepted_hits.bam \
/home/stellab/private/genome_analysis/results/6_genome_annotation/unzipped.maker.output/unzipped_no_fasta.all.gff > \
/home/stellab/private/genome_analysis/results/7_differential_expression/cs17_forelimb/htseq_count.txt

htseq-count -f bam -s no -t gene -i ID /home/stellab/private/genome_analysis/results/7_differential_expression/cs17_hindlimb/accepted_hits.bam \
/home/stellab/private/genome_analysis/results/6_genome_annotation/unzipped.maker.output/unzipped_no_fasta.all.gff > \
/home/stellab/private/genome_analysis/results/7_differential_expression/cs17_hindlimb/htseq_count.txt
