library(data.table)
library(matrixStats)
library(stats)
library(gplots)
library(DESeq2)
library(ggplot2)
library(RColorBrewer)
library(pheatmap)

htseq_data <- read.table("/home/stellab/private/genome_analysis/results/7_differential_expression/htseq_count.txt")

print(type(htseq_data))

