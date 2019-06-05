# library(data.table)
library(matrixStats)
library(stats)
library(gplots)
library(DESeq2)
library(ggplot2)
library(RColorBrewer)
library(pheatmap)

cs15_forelimb <- read.table("/Users/stellabelin/genome_analysis/results/7_differential_expression/HTSeq_counts/cs15_forelimb/htseq_count.txt")
cs15_hindlimb <- read.table("/Users/stellabelin/genome_analysis/results/7_differential_expression/HTSeq_counts/cs15_hindlimb/htseq_count.txt")
cs16_forelimb <- read.table("/Users/stellabelin/genome_analysis/results/7_differential_expression/HTSeq_counts/cs16_forelimb/htseq_count.txt")
cs16_hindlimb <- read.table("/Users/stellabelin/genome_analysis/results/7_differential_expression/HTSeq_counts/cs16_hindlimb/htseq_count.txt")
cs17_forelimb <- read.table("/Users/stellabelin/genome_analysis/results/7_differential_expression/HTSeq_counts/cs17_forelimb/htseq_count.txt")
cs17_hindlimb <- read.table("/Users/stellabelin/genome_analysis/results/7_differential_expression/HTSeq_counts/cs17_hindlimb/htseq_count.txt")

names(cs15_forelimb)[2] <- "cs15_forelimb"
names(cs15_hindlimb)[2] <- "cs15_hindlimb"
names(cs16_forelimb)[2] <- "cs16_forelimb"
names(cs16_hindlimb)[2] <- "cs16_hindlimb"
names(cs17_forelimb)[2] <- "cs17_forelimb"
names(cs17_hindlimb)[2] <- "cs17_hindlimb"

cs15_forelimb <- head(cs15_forelimb,-5)
cs15_hindlimb <- head(cs15_hindlimb,-5)
cs16_forelimb <- head(cs16_forelimb,-5)
cs16_hindlimb <- head(cs16_hindlimb,-5)
cs17_forelimb <- head(cs17_forelimb,-5)
cs17_hindlimb <- head(cs17_hindlimb,-5)

all_dev_stages <- merge(cs15_forelimb,cs15_hindlimb,by="V1")
all_dev_stages <- merge(all_dev_stages,cs16_forelimb,by="V1")
all_dev_stages <- merge(all_dev_stages,cs16_hindlimb,by="V1")
all_dev_stages <- merge(all_dev_stages,cs17_forelimb,by="V1")
all_dev_stages <- merge(all_dev_stages,cs17_hindlimb,by="V1")

row.names(all_dev_stages) <- all_dev_stages$V1
all_dev_stages <- all_dev_stages[,-1]

deseq2.matr <- as.matrix(all_dev_stages[c("cs15_forelimb","cs15_hindlimb","cs16_forelimb",
                                           "cs16_hindlimb","cs17_forelimb","cs17_hindlimb")])

metadata <- matrix(c("cs15","forelimb","cs15","hindlimb","cs16","forelimb","cs16","hindlimb","cs17",
                     "forelimb","cs17","hindlimb"),ncol=2,byrow=TRUE)
colnames(metadata) <- c("condition", "type")
rownames(metadata) <- c("cs15_forelimb","cs15_hindlimb","cs16_forelimb","cs16_hindlimb","cs17_forelimb",
                        "cs17_hindlimb")

deseq_data <- DESeqDataSetFromMatrix(deseq2.matr,colData = metadata,design = ~ condition + type)

deseq_data <- DESeq(deseq_data)

#deseq_results <- results(deseq_data, contrast=c("type","forelimb","hindlimb"))

deseq_lfc_hl_fl = lfcShrink(deseq_data, coef = "type_hindlimb_vs_forelimb", type = "apeglm")
deseq_lfc_cs15_cs16 = lfcShrink(deseq_data, coef = "condition_cs16_vs_cs15", type = "apeglm")
deseq_lfc_cs15_cs17 = lfcShrink(deseq_data, coef = "condition_cs17_vs_cs15", type = "apeglm")

resultsNames(deseq_data)

deseq_results_ordered <- deseq_lfc_hl_fl[order(deseq_lfc_hl_fl$padj),]
deseq_summary <- summary(deseq_results_ordered)
deseq_results_significant <- subset(deseq_results_ordered, deseq_results_ordered$padj < 0.05)
plotMA(deseq_results_significant,main="FL vs. HL")
text(deseq_results_significant$baseMean[1],deseq_results_significant$log2FoldChange[1],"PITX1",pos=4,cex=0.8)
text(deseq_results_significant$baseMean[16],deseq_results_significant$log2FoldChange[16],"FSTL4",pos=4,cex=0.8)

deseq_results_ordered_cs15_cs16 <- deseq_lfc_cs15_cs16[order(deseq_lfc_cs15_cs16$padj),]
deseq_results_significant_cs15_cs16 <- subset(deseq_results_ordered_cs15_cs16, 
                                              deseq_results_ordered_cs15_cs16$padj < 0.05)
plotMA(deseq_results_significant_cs15_cs16,main="cs15 vs. cs16")

deseq_results_ordered_cs15_cs17 <- deseq_lfc_cs15_cs17[order(deseq_lfc_cs15_cs17$padj),]
deseq_results_significant_cs15_cs17 <- subset(deseq_results_ordered_cs15_cs17, 
                                              deseq_results_ordered_cs15_cs17$padj < 0.05)
#deseq_significant_summary <- summary(deseq_results_significant)
plotMA(deseq_results_significant_cs15_cs17,main="cs15 vs. cs17")
text(deseq_results_significant_cs15_cs17$baseMean[17],deseq_results_significant_cs15_cs17$log2FoldChange[17],"FSTL4",pos=4,cex=0.8)



colnames(deseq2.matr) <- c("cs15_FL","cs15_HL","cs16_FL","cs16_HL","cs17_FL","cs17_HL")

z_score <- (deseq2.matr-rowMeans(deseq2.matr))/(rowSds(deseq2.matr))[row(deseq2.matr)]
row.clus <-hclust(dist(deseq2.matr))
heatmap.2(z_score, Rowv = as.dendrogram(row.clus), Colv = NA, col=bluered,
          density.info = "none", trace = "none", margins = c(8,8),labRow = "")

genes_significant <- rownames(deseq_results_significant)
htseq_genes_significant <- deseq2.matr[is.element(rownames(deseq2.matr), genes_significant),]
gene_blast_names <- c("PITX1","CUNH5orf15","UBE2B","SAR1B","TGFBI","LOC107525378","SEC24A","UBE2B",
                      "SMAD5","AFF4","JADE2","DDX46","PPP2CA","SKP1","CATSPER3","FSTL4","ZCCHC10",
                      "CAMLG","JADE2","TCF7")
rownames(htseq_genes_significant) <- gene_blast_names

z_score_significant <- (htseq_genes_significant-rowMeans(htseq_genes_significant))/
  (rowSds(as.matrix(htseq_genes_significant)))[row(htseq_genes_significant)]
row_significant.clus <- hclust(dist(htseq_genes_significant))
heatmap.2(z_score_significant, Rowv = as.dendrogram(row_significant.clus), Colv = NA, 
          col=bluered, colsep=0:6, dendrogram="row",rowsep=0:20, sepwidth =c(0.002,0.0002), sepcolor = "gray",
          density.info = "none", trace = "none", margins = c(6,8),cexCol=1.1 )
 

