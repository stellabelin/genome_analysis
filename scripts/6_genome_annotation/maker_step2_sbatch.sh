#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 2:00:00
#SBATCH -J genome_annotation_step2
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

# Load modules
module load bioinfo-tools
module load maker
module load snap

cd /home/stellab/private/genome_analysis/results/6_genome_annotation/unzipped.maker.output/

gff3_merge -d unzipped_master_datastore_index.log

maker2zff unzipped.all.gff

fathom genome.ann genome.dna -validate > snap_validate_output.txt