cycle_genes = read.table("Grant_CellCycleGenes.txt",sep="\t",as.is=T, header=T, dec=".", comment.char = "", quote = '"')
cycle_genes$entrez = as.numeric(unlist(lapply(strsplit(cycle_genes$NAME," \\^"),function(x) x[4])))
cycle_genes$symbol = gsub(" ","",unlist(lapply(strsplit(cycle_genes$NAME," \\^"),function(x) x[2])))

cycle_genes_filtered=subset(cycle_genes, !(is.na(entrez) | symbol=="") )

cell_cycle_consistency = read.table("CellCycleGenes_Consistency.txt",sep="\t",header=T, as.is=T, quote='"', comment.char="")

cycle_genes_grant_2013 = merge(cycle_genes_filtered, cell_cycle_consistency, by.x="symbol", by.y="Symbol",all.x=T)
save(cycle_genes_grant_2013, file="Grant_2013_cycle_genes.Rdata")
