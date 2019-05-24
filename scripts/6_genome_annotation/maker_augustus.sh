#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J genome_annotation_augustus
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

module load bioinfo-tools
module load maker
module load augustus

chmod +x ./zff2augustus_gbk.pl
cpan Bio::DB::Fasta
./zff2augustus_gbk.pl > augustus.gbk
