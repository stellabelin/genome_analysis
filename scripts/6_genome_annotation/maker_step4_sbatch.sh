#!/bin/bash -l
#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 2:00:00
#SBATCH -J genome_annotation_step3
#SBATCH --mail-type=ALL
#SBATCH --mail-user stella.belin@me.com

module load bioinfo-tools
module load maker
module load augustus

cd /home/stellab/private/genome_analysis/results/6_genome_annotation
export AUGUSTUS_CONFIG_PATH="/home/stellab/private/genome_analysis/results/6_genome_annotation/augustus/config"
maker

