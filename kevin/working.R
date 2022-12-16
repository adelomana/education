#
# This script performs ontology enrichment on ATG7-201 and ATG7-202 clusters
#

##########################################33  doubule cehck this again, which function is the good one?https://yulab-smu.top/biomedical-knowledge-mining-book/reactomepa.html

library(clusterProfiler)
library(ReactomePA)

#
# read data
#
input_file = '/home/adrian/hub/education/kevin/gold_transcripts.tsv'
df = read.csv(input_file)
ensembls = df$ENSEMBL
gold_ids = bitr(ensembls, fromType="ENSEMBL", toType="ENTREZID", OrgDb="org.Hs.eg.db")
print(dim(gold_ids))

input_file = '/home/adrian/hub/education/kevin/skyblue_transcripts.tsv'
df = read.csv(input_file)
ensembls = df$ENSEMBL
skyblue_ids = bitr(ensembls, fromType="ENSEMBL", toType="ENTREZID", OrgDb="org.Hs.eg.db")
print(dim(skyblue_ids))

#
# perform analysis
#
enrichment_gold = enrichPathway(gene=gold_ids$ENTREZID, readable=TRUE)
enrichment_skyblue = enrichPathway(gene=skyblue_ids$ENTREZID, readable=TRUE)

#
# store information
#
# rule = enrichment_@result['p.adjust'] < 0.05
# enrichment@result[rule, ]
# dim(enrichment@result[rule, ])
