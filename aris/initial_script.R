#
# user-defined variables
#
data_file = '/home/adrian/gd15/hi/edu/aris teaching/data/modificationSpecificPeptides.csv'
working_columns = c('Sequence', 'Intensity.1_1', 'Intensity.1_2', 'Intensity.2_1', 'Intensity.2_2', 'Intensity.3_1', 'Intensity.3_2', 'Intensity.4_1', 'Intensity.4_2', 'Intensity.5_1', 'Intensity.5_2', 'Intensity.6_1', 'Intensity.6_2')

#
# read data
# 
df = read.csv(data_file)
working_data = df[, working_columns]

#
# transform lin data into log scale. Determine an epsilon from lowest intensity
#
hist_result = hist(log2(working_data[, 3]), breaks = 200)
library(WGCNA)
plotMultiHist(log2(working_data))
# need to find features that are either never detected or always detected across the three replicates. Then exclude what is always zero
