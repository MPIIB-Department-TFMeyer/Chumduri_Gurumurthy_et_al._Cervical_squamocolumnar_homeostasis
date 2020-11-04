LIB=/data_genome1/SharedSoftware/AffymetrixPowerTools/Library
BIN=/data_genome1/SharedSoftware/AffymetrixPowerTools/apt-1.15.2-x86_64-intel-linux/bin
CHIP=HuEx-1_0-st-v2.r2
#-a plier-gcbg-sketch -a dabg
$BIN/apt-probeset-summarize -a rma-sketch -a dabg \
-p $LIB/${CHIP}.pgf \
-c $LIB/${CHIP}.clf \
-b $LIB/${CHIP}.antigenomic.bgp \
--qc-probesets $LIB/${CHIP}.qcc \
-m $LIB/${CHIP}.dt1.hg18.core.mps \
-o ./output_affy/ ../Raw/All_CEL/*.CEL


