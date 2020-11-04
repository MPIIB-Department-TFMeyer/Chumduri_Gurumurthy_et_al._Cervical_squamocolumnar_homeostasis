rm(list=ls())
setwd("/data_genome2/public_data/GroundState/Preprocessing/")

#Load the necessary libraries
library(GEOquery)
library(affy)
library(oligo)
library(gcrma)
library(huex10sthsensgcdf)
library(huex10sthsensgprobe)
#library(hugene10stprobeset.db)
#library(hugene10sttranscriptcluster.db)

# This does not work. For Oligo, one would have to generate a custom package for oligo (see here: https://support.bioconductor.org/p/72378/)

# For XPS, ROOT has to be installed manually, since the version provided by Ubuntu 14.04 is not the right one. 

exp.cel <- read.celfiles(list.celfiles("../Raw/All_CEL/", full.names = T))

d = getwd()
setwd("../Raw/All_CEL/")
raw.data=ReadAffy(verbose=TRUE, filenames=cels, cdfname="huex10sthsensg") 
setwd(d)
#perform RMA normalization (I would normally use GCRMA but it did not work with this chip)
data.rma.norm=rma(raw.data)

#Get the important stuff out of the data - the expression estimates for each array
rma=exprs(data.rma.norm)

#Format values to 5 decimal places
rma=format(rma, digits=5)

#Map probe sets to gene symbols or other annotations
#To see all available mappings for this platform
ls("package:hugene10stprobeset.db") #Annotations at the exon probeset level
ls("package:hugene10sttranscriptcluster.db") #Annotations at the transcript-cluster level (more gene-centric view)

#Extract probe ids, entrez symbols, and entrez ids
probes=row.names(rma)
Symbols = unlist(mget(probes, hugene10sttranscriptclusterSYMBOL, ifnotfound=NA))
Entrez_IDs = unlist(mget(probes, hugene10sttranscriptclusterENTREZID, ifnotfound=NA))

#Combine gene annotations with raw data
rma=cbind(probes,Symbols,Entrez_IDs,rma)

#Write RMA-normalized, mapped data to file
write.table(rma, file = "rma.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)
