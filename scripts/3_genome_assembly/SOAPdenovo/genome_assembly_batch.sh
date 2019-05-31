#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 03:00:00
#SBATCH -J genome_assembly_soapdenovo
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

# Load modules
module load bioinfo-tools

# Your commands
/sw/bioinfo/SOAPdenovo/2.04-r240/rackham/bin/SOAPdenovo-63mer all -s soapdenovo.config -K 49 -o /home/stellab/private/genome_analysis/results/3_genome_assembly/kmer_49/new_config
