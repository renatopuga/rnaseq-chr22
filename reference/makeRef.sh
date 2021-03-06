
# get reference genome fasta
#wget -c ftp://ftp.ensembl.org/pub/release-75/fasta/homo_sapiens/dna/Homo_sapiens.GRCh37.75.dna.primary_assembly.fa.gz

# get refernece genome gtf
#wget -c ftp://ftp.ensembl.org/pub/release-75/gtf/homo_sapiens/Homo_sapiens.GRCh37.75.gtf.gz

#gunzip -v Homo_sapiens.GRCh37.75.gtf.gz
#gunzip -v Homo_sapiens.GRCh37.75.dna.primary_assembly.fa.gz

GTF="chr22.GRCh37.75.gtf"
FASTA="chr22.fa"

mkdir -p rsem

# rsem: prepare reference
/scratch/apps/RSEM/rsem-prepare-reference --gtf $GTF \
        --bowtie2 \
        $FASTA \
        rsem/rsem

# caminho do executavel do programa STAR
GENOMEDIR="/scratch/refs/chr22"
STAR="/scratch/apps/STAR/bin/Linux_x86_64/STAR"
RSEM="/scratch/apps/RSEM"

# 1/4 - Generating genome indexes
$STAR --runThreadN 6 \
       --runMode genomeGenerate \
       --genomeDir $GENOMEDIR \
       --genomeFastaFiles $FASTA \
       --sjdbGTFfile $GTF \
       --sjdbOverhang 149

