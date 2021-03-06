
STAR="./apps/STAR-2.7.8a/bin/Linux_x86_64/STAR"
RSEM="./apps/RSEM-1.3.3"

GTF="chr22.GRCh37.75.gtf"
FASTA="chr22.fa"

mkdir -p rsem

# rsem: prepare reference
$RSEM/rsem-prepare-reference --gtf $GTF \
        --bowtie2 \
        $FASTA \
        rsem/rsem

# caminho do executavel do programa STAR
# 1/4 - Generating genome indexes
$STAR --runThreadN 6 \
       --runMode genomeGenerate \
       --genomeDir ./ \
       --genomeFastaFiles $FASTA \
       --sjdbGTFfile $GTF \
       --sjdbOverhang 149

