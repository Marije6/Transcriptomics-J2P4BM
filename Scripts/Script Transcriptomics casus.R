###########################################################
# Transcriptomics analyse Rheumatoïde Artritis (RA)
###########################################################

########################
# 1. WORKING DIRECTORY
########################

setwd("C:/Users/marij/OneDrive - NHL Stenden/leerjaar 2/periode 4/Transcriptomics-J2P4BM/Data/Data_RA_raw/Data_RA_raw/")

########################
# 2. PACKAGES INSTALLEREN EN LADEN
########################

BiocManager::install(c(
  "Rsubread",
  "DESeq2",
  "KEGGREST",
  "EnhancedVolcano",
  "clusterProfiler",
  "org.Hs.eg.db",
  "pathview"
))

library(Rsubread)
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(clusterProfiler)
library(org.Hs.eg.db)
library(pathview)

########################
# 3. REFERENTIEGENOOM INDEXEREN
########################

buildindex(
  basename = "ref_reuma",
  reference = "GCF_000001405.40_GRCh38.p14_genomic.fna",
  memory = 4000,
  indexSplit = TRUE
)

########################
# 4. READS ALIGNEREN
########################

# Controlesamples

align(
  index = "ref_reuma",
  readfile1 = "SRR4785819_1_subset40k.fastq",
  readfile2 = "SRR4785819_2_subset40k.fastq",
  output_file = "contrl1.BAM"
)

align(
  index = "ref_reuma",
  readfile1 = "SRR4785820_1_subset40k.fastq",
  readfile2 = "SRR4785820_2_subset40k.fastq",
  output_file = "contrl2.BAM"
)

align(
  index = "ref_reuma",
  readfile1 = "SRR4785828_1_subset40k.fastq",
  readfile2 = "SRR4785828_2_subset40k.fastq",
  output_file = "contrl3.BAM"
)

align(
  index = "ref_reuma",
  readfile1 = "SRR4785831_1_subset40k.fastq",
  readfile2 = "SRR4785831_2_subset40k.fastq",
  output_file = "contrl4.BAM"
)

# RA-patiënten

align(
  index = "ref_reuma",
  readfile1 = "SRR4785979_1_subset40k.fastq",
  readfile2 = "SRR4785979_2_subset40k.fastq",
  output_file = "reuma1.BAM"
)

align(
  index = "ref_reuma",
  readfile1 = "SRR4785980_1_subset40k.fastq",
  readfile2 = "SRR4785980_2_subset40k.fastq",
  output_file = "reuma2.BAM"
)

align(
  index = "ref_reuma",
  readfile1 = "SRR4785986_1_subset40k.fastq",
  readfile2 = "SRR4785986_2_subset40k.fastq",
  output_file = "reuma3.BAM"
)

align(
  index = "ref_reuma",
  readfile1 = "SRR4785988_1_subset40k.fastq",
  readfile2 = "SRR4785988_2_subset40k.fastq",
  output_file = "reuma4.BAM"
)

########################
# 5. COUNT MATRIX MAKEN
########################

all.samples <- c(
  "contrl1.BAM",
  "contrl2.BAM",
  "contrl3.BAM",
  "contrl4.BAM",
  "reuma1.BAM",
  "reuma2.BAM",
  "reuma3.BAM",
  "reuma4.BAM"
)

count_matrix <- featureCounts(
  files = all.samples,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE
)

counts <- count_matrix$counts

colnames(counts) <- c(
  "contrl1", "contrl2", "contrl3", "contrl4",
  "reuma1", "reuma2", "reuma3", "reuma4"
)

write.csv(counts, "reuma_countmatrix.csv")

########################
# 6. DESEQ2 ANALYSE
########################

treatment_table <- data.frame(
  treatment = c(
    "control", "control", "control", "control",
    "patient", "patient", "patient", "patient"
  )
)

rownames(treatment_table) <- colnames(counts)

dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = treatment_table,
  design = ~ treatment
)

dds <- DESeq(dds)

resultaten <- results(dds)

write.csv(resultaten, "Resultaten_RA.csv")

########################
# 7. DIFFERENTIEEL GEXPRESSEERDE GENEN
########################

upregulated <- sum(
  resultaten$padj < 0.05 &
    resultaten$log2FoldChange > 1,
  na.rm = TRUE
)

downregulated <- sum(
  resultaten$padj < 0.05 &
    resultaten$log2FoldChange < -1,
  na.rm = TRUE
)

########################
# 8. VOLCANO PLOT
########################

EnhancedVolcano(
  resultaten,
  lab = rownames(resultaten),
  x = "log2FoldChange",
  y = "padj"
)

########################
# 9. GO-ANALYSE
########################

sig_genen <- subset(
  resultaten,
  padj < 0.05 &
    abs(log2FoldChange) > 1
)

gene.df <- bitr(
  rownames(sig_genen),
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

ego_bp <- enrichGO(
  gene = gene.df$ENTREZID,
  OrgDb = org.Hs.eg.db,
  ont = "BP",
  keyType = "ENTREZID",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05
)

dotplot(ego_bp, showCategory = 15)

########################
# 10. KEGG-ANALYSE
########################

entrez_ids <- mapIds(
  org.Hs.eg.db,
  keys = rownames(sig_genen),
  column = "ENTREZID",
  keytype = "SYMBOL",
  multiVals = "first"
)

entrez_ids <- na.omit(entrez_ids)

kegg_result <- enrichKEGG(
  gene = entrez_ids,
  organism = "hsa",
  pvalueCutoff = 0.05
)

dotplot(kegg_result, showCategory = 10)

########################
# 11. PATHVIEW
########################

gene_data <- sig_genen$log2FoldChange
names(gene_data) <- entrez_ids
gene_data <- gene_data[!is.na(names(gene_data))]

top_pathway <- as.data.frame(kegg_result)$ID[1]

pathview(
  gene.data = gene_data,
  pathway.id = top_pathway,
  species = "hsa"
)

#inzoomen pathway
View(kegg_df)
#
grep("Rheumatoid", kegg_df$Description, value = TRUE)
#
grep("TNF", kegg_df$Description, value = TRUE)
#
grep("IL-17", kegg_df$Description, value = TRUE)
#

pathview(
  gene.data = gene_data,
  pathway.id = "hsa05323",
  species = "hsa"
)
