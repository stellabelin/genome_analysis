#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J RNA_mapping
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

### Load modules
module load bioinfo-tools
module load tophat

bowtie2-build -f /home/stellab/private/genome_analysis/raw_data/unzipped.fasta /home/stellab/private/genome_analysis/results/7_differential_expression/reference

tophat -o /home/stellab/private/genome_analysis/results/7_differential_expression/all_sequences \
/home/stellab/private/genome_analysis/results/7_differential_expression/reference \
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719013.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719014.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719015.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719016.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719017.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719018.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719204.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719206.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719207.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719208.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719209.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719211.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719212.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719213.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719214.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719241.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719242.trim_1P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719013.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719014.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719015.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719016.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719017.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719018.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719204.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719206.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719207.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719208.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719209.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719211.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719212.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719213.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719214.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719241.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719242.trim_2P.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719013.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719014.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719015.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719016.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719017.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719018.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719204.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719206.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719207.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719208.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719209.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719211.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719212.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719213.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719214.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719241.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719242.trim_1U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719013.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719014.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719015.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719016.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719017.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719018.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719204.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719206.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719207.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719208.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719209.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719211.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719212.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719213.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719214.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719241.trim_2U.fastq.gz,\
/home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/sel3_SRR1719242.trim_2U.fastq.gz
