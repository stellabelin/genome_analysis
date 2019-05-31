#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 4:00:00
#SBATCH -J tophat_cs17
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

### Load modules
module load bioinfo-tools
module load tophat

bowtie2-build -f /home/stellab/private/genome_analysis/raw_data/unzipped.fasta /home/stellab/private/genome_analysis/results/7_differential_expression/ref

# cs17 forelimb
tophat -o /home/stellab/private/genome_analysis/results/7_differential_expression/cs17_forelimb/ \
/home/stellab/private/genome_analysis/results/7_differential_expression/ref \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719208.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719209.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719211.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719208.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719209.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719211.trim_2P.fastq.gz

# cs17 hindlimb
tophat -o /home/stellab/private/genome_analysis/results/7_differential_expression/cs17_hindlimb/ \
/home/stellab/private/genome_analysis/results/7_differential_expression/ref \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719213.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719241.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/results/2_trimming/sel3_SRR1719266.trim_1P.fastq.gz, \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719213.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/trimmed/sel3_SRR1719241.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/results/2_trimming/sel3_SRR1719266.trim_2P.fastq.gz 