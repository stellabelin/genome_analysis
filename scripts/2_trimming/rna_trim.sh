#!/bin/bash -L
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J rna_trimming
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

# Load modules
module load bioinfo-tools
module load trimmomatic

java -jar /sw/apps/bioinfo/trimmomatic/0.36/rackham/trimmomatic-0.36.jar PE -phred33 \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719266.2.fastq.gz \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719266.1.fastq.gz \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719266.trim_2P.fastq.gz \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719266.trim_2U.fastq.gz \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719266.trim_1P.fastq.gz \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719266.trim_1U.fastq.gz \
ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
