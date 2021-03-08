
# Expression table merge by genes
cd RNASEQ_data

mkdir gene-level
cd gene-level
ls -d1 ../rsem.* | gawk '{print("ln -s",$1"/rsem.genes.results",gensub("../rsem.","","g",$1))}' | sh
cd ..
time R --file=../run.merge.files.R --args gene-level 5 gene-level-5

# Expression table merge by isoforms
mkdir transcript-level
cd transcript-level
ls -d1 ../rsem.* | gawk '{print("ln -s",$1"/rsem.genes.results",gensub("../rsem.","","g",$1))}' | sh
cd ..
time R --file=../run.merge.files.R --args transcript-level 5 transcript-level
