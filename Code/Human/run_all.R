#!/data_genome1/SharedSoftware/R/3.4/lib64/R/bin/exec/R
library('knitr')
library(rmarkdown)
rmarkdown::render('Preprocessing_and_QC_human.Rmd');
rmarkdown::render('Expression_analysis_human.Rmd');
rmarkdown::render('Gene_Lists_and_Signatures.Rmd');
rmarkdown::render('Visualizations_further_analysis.Rmd');
rmarkdown::render('Human_Transcription_factors.Rmd');

quit('no')

