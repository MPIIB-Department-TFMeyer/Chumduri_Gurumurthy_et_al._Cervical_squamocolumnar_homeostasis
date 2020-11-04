setwd("/data_genome1/public_data/TCGA/CervicalCancer_2017_Data/RNASeq/")

file_pattern = ".+\\.rsem\\.genes\\.results"
inp_data_folder = "./unc.edu_CESC.IlluminaHiSeq_RNASeqV2.Level_3.1.11.0/"
d = getwd()
setwd(inp_data_folder)
all_files = dir(pattern=file_pattern)

all_samples = list()

for (ff in all_files) {
  tmp = read.table(ff, header=T, sep="\t", colClasses = c("character", "numeric","numeric","character"), as.is=T)
  tmp2 = data.frame(tmp$raw_count)
  colnames(tmp2) = ff
  rownames(tmp2) = tmp$gene_id 
  all_samples[[ff]] = tmp2
}
setwd(d)
expr_mat_TCGA = as.matrix(do.call(cbind, all_samples))
gene_symbol = sapply(strsplit(rownames(expr_mat_TCGA),"\\|"), function(x) x[1])
entrez_id = sapply(strsplit(rownames(expr_mat_TCGA),"\\|"), function(x) x[2])
rownames(expr_mat_TCGA) = entrez_id

# The RNASeq data provided with the publication contains 310 samples in total - including samples not used in the publication. 
# Filter RNASeq data down to the Core Data set of 178 cases
sample_freeze = read.table("../CESC_sample_freeze.txt", sep="\t", header=F, stringsAsFactors = F)
ds_freeze = read.table("../CESC_data_freeze.tsv", sep="\t", header=T, stringsAsFactors = F, comment.char="")
ds_rna = subset(ds_freeze, DATA_TYPE=="RNASeqV2" )
ds_rna$filename = basename(ds_rna$URL)
ds_rna_filtered = subset(ds_rna, filename %in% all_files & SAMPLE %in% sample_freeze$V1)
rownames(ds_rna_filtered) = ds_rna_filtered$filename

expr_mat_TCGA = expr_mat_TCGA[, colnames(expr_mat_TCGA) %in% ds_rna_filtered$filename]
colnames(expr_mat_TCGA) = ds_rna_filtered[colnames(expr_mat_TCGA), "SAMPLE"]

pheno_all = read.table("../Data_Summary_Table_TCGA_CESC_2017.csv", sep="\t", header=T, as.is=T)
ed_TCGA = pheno_all
rownames(ed_TCGA) = ed_TCGA$SampleID

save(ed_TCGA, expr_mat_TCGA, file="TCGA_Cervix_RNASeq_v2_counts_2019-04-10.Rdata")
