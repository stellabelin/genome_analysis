# install.packages(data.table)
# install.packages(matrixStats)
# install.packages(stats)
# install.packages(gplots)
# install.packages(DESeq2)
# install.packages(ggplot2)
# install.packages(RColorBrewer)
# install.packages(pheatmap)
# 
# library(data.table)
# library(matrixStats)
# library(stats)
# library(gplots)
library(DESeq2)
# library(ggplot2)
# library(RColorBrewer)
# library(pheatmap)

total_count <- read.table("/home/stellab/private/genome_analysis/results/7_differential_expression/htseq_count.txt")

cs15_forelimb <- read.table("/home/stellab/private/genome_analysis/results/7_differential_expression/htseq_count.txt")
cs15_hindlimb <- read.table("/home/stellab/private/genome_analysis/results/7_differential_expression/htseq_count.txt")
cs16_forelimb <- read.table("/home/stellab/private/genome_analysis/results/7_differential_expression/htseq_count.txt")
cs16_hindlimb <- read.table("/home/stellab/private/genome_analysis/results/7_differential_expression/htseq_count.txt")

names(cs15_forelimb)[2] <- "cs15_forelimb"
names(cs15_hindlimb)[2] <- "cs15_hindlimb"
names(cs16_forelimb)[2] <- "cs16_forelimb"
names(cs16_hindlimb)[2] <- "cs16_hindlimb"

cs15_forelimb <- head(cs15_forelimb,-5)
cs15_hindlimb <- head(cs15_hindlimb,-5)
cs16_forelimb <- head(cs16_forelimb,-5)
cs16_hindlimb <- head(cs16_hindlimb,-5)

both_dev_stages <- merge(cs15_forelimb,cs15_hindlimb,by="V1")
both_dev_stages <- merge(both_dev_stages,cs16_forelimb,by="V1")
both_dev_stages <- merge(both_dev_stages,cs16_hindlimb,by="V1")

print(both_dev_stages)

deseq2.matr <- as.matrix(both_dev_stages[c("cs15_forelimb","cs15_hindlimb","cs16_forelimb","cs16_hindlimb")])

print(deseq2.matr)




