#
# This script performs ontology enrichment on ATG7-201 and ATG7-202 clusters
#
library(clusterProfiler)
library(ReactomePA)
library(enrichplot)

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
enrichment_gold = enrichPathway(gene=gold_ids$ENTREZID, readable=TRUE, minGSSize=10)
enrichment_skyblue = enrichPathway(gene=skyblue_ids$ENTREZID, readable=TRUE, minGSSize=10)

#
# subset results
#
rule = enrichment_gold@result['qvalue'] < 0.01
subset_gold = enrichment_gold[rule, ]
dim(subset_gold)
View(subset_gold)

rule = enrichment_skyblue@result['qvalue'] < 0.01
subset_skyblue = enrichment_skyblue[rule, ]
dim(subset_skyblue)
View(subset_skyblue)

#
# store information
#


#
# make figure
#
all_identifiers = list()
all_identifiers[['gold set']] = gold_ids$ENTREZID
all_identifiers[['skyblue set']] = skyblue_ids$ENTREZID

ck = compareCluster(all_identifiers, fun="enrichPathway", pvalueCutoff=0.01)
sm = pairwise_termsim(ck)
dotplot(ck, size='count', showCategory=30)



