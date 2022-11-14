# Specify database:
feather_database_url='https://resources.aertslab.org/cistarget/databases/homo_sapiens/hg38/refseq_r80/mc9nr/gene_based/hg38__refseq-r80__10kb_up_and_down_tss.mc9nr.genes_vs_motifs.rankings.feather'
# feather_database_url='https://resources.aertslab.org/cistarget/databases/homo_sapiens/hg38/refseq_r80/mc9nr/gene_based/hg38__refseq-r80__500bp_up_and_100bp_down_tss.mc9nr.genes_vs_motifs.rankings.feather'
feather_database="${feather_database_url##*/}"

# Download database directly (with wget or curl):
#wget "${feather_database_url}"
curl -O "${feather_database_url}"

# Download sha256sum.txt (with wget or curl):
curl -O https://resources.aertslab.org/cistarget/databases/sha256sum.txt

# Check if sha256 checksum matches for the downloaded database:
awk -v feather_database=${feather_database} '$2 == feather_database' sha256sum.txt | sha256sum -c -
