
# Overview
Scripts and data for microarray analyses in the manuscript by Chumduri and Gurumurthy et al.: Opposing Wnt signals regulate cervical squamocolumnar homeostasis and emergence of metaplasia. 

# Requirements

## Hardware and Software

All analyses were run on a 48 core server with 256 Gbytes of RAM, running Ubuntu 16.04. Data, code and results require at least approximately 5G of available hard disk space.

To reproduce the analysis you will need some or all of the following software:

  - R (>= v3.4.0) [cran.r-project.org]

The following R packages should be installed from either CRAN or Bioconductor:

  - BiocParallel
  - Biostrings
  - BSgenome.Hsapiens.UCSC.hg19
  - BSgenome.Hsapiens.UCSC.hg38
  - data.table
  - deconstructSigs
  - directlabels
  - DNAshapeR
  - dplyr
  - GenomicFeatures
  - GenomicRanges
  - ggplot2
  - ggpubr
  - ggseqlogo
  - ggthemes
  - grid
  - gridExtra
  - Hmisc
  - knitr
  - naturalsort
  - pheatmap
  - randomForest
  - readxl
  - reshape2
  - rgl
  - rmarkdown
  - robust
  - robustbase
  - scales
  - seqRFLP
  - stringr
  - VariantAnnotation

## External data

Some data used in this analysis has not been included in this repository due to license limitations or size. All external data sets are listed under ./Data/External, accompanied by   source URLs and further scripts and instructions for processing.


# Run the analysis

Each subfolder under ./Code contains a file *run_all.sh* that should run all scripts of a given part of the study and will produce result tables and figures under /Results.

# Figures

Mappings of figures in the published manuscript to individual scripts can be found in file *figure_mapping.txt*








