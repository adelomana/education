library(biomaRt)

db = useEnsembl(biomart="genes", dataset="hsapiens_gene_ensembl", version=109)

###
### which attributes can be retrieved?
###
#! listAttributes(mart=db)

###
### for uniprot-related IDs it seems that there are these ones, but maybe I am missing others, don't know
###
# uniprot_gn_symbol       UniProtKB Gene Name symbol
# uniprot_gn_id           UniProtKB Gene Name ID
# uniprot_isoform         UniProtKB isoform ID
# uniprotswissprot        UniProtKB/Swiss-Prot ID
# uniprotsptrembl         UniProtKB/TrEMBL ID

###
### biomart allows only three external attributes at the time: https://support.bioconductor.org/p/39744/
###
working_atributes = c('ensembl_gene_id', 'description', 
                      'hgnc_symbol', 'uniprot_gn_symbol', 'uniprot_gn_id')
table_a= getBM(attributes=working_atributes, mart=db)
View(table_a)

working_atributes = c('ensembl_gene_id', 
                      'uniprot_isoform', 'uniprotswissprot', 'uniprotsptrembl')
table_b= getBM(attributes=working_atributes, mart=db)
View(table_b)