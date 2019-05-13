#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J genome_assembly_evaluation_soapdenovo
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

# Load modules
module load bioinfo-tools
module load MUMmer

mummer -mum -b -c /proj/g2019003/nobackup/private/2_Eckalbar_2016/additional_data/sel3_NW_015504249.fna.gz \
/home/stellab/private/genome_analysis/results/3_genome_assembly/kmer_49/output.scaf > /home/stellab/private/genome_analysis/results/5_assembly_quality/soapdenovo_output.mums

mummer -mum -b -c /proj/g2019003/nobackup/private/2_Eckalbar_2016/additional_data/sel3_NW_015504249.fna.gz \
/home/stellab/private/genome_analysis/results/3_genome_assembly/kmer_49/output.scaf > /home/stellab/private/genome_analysis/results/5_assembly_quality/spades_output.mums


