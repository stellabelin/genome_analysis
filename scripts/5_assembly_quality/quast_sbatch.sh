#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J genome_assembly_evaluation_quast
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

# Load modules
module load bioinfo-tools
module load quast

python quast.py -o /home/stellab/private/genome_analysis/results/5_assembly_quality/quast \
-r /home/stellab/private/genome_analysis/raw_data/unzipped.fasta \
-g /home/stellab/private/genome_analysis/results/3_genome_assembly/spades/scaffolds.fasta


