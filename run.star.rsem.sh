
# ENV variables
GENOMEDIR="reference"
STAR="./apps/STAR-2.7.8a/bin/Linux_x86_64/STAR"
RSEM="./apps/RSEM-1.3.3"
FASTA="$GENOMEDIR/chr22.fa "
GTF="$GENOMEDIR/chr22.GRCh37.75.gtf"

# make dir RNASEQ_data
mkdir -p RNASEQ_data

# loop by samples
for fastqR1 in `ls -1 input/*_1.fq.gz`
do
        # create fastqR2 path
        fastqR2=$(echo $fastqR1 | sed -e "s/_1.fq.gz/_2.fq.gz/g")

        # make dir sample output dir
        mkdir "RNASEQ_data/$(basename $fastqR1 _1.fq.gz)"

        # run star
        $STAR --genomeDir $GENOMEDIR \
	--readFilesIn $fastqR1 $fastqR2 \
        --readFilesCommand zcat \
	--limitBAMsortRAM 8000000000 \
	--outSAMtype BAM SortedByCoordinate \
	--outSAMunmapped Within \
	--twopassMode Basic \
	--outFilterMultimapNmax  4 \
	--quantMode TranscriptomeSAM \
	--runThreadN 4 \
	--outFileNamePrefix "RNASEQ_data/$(basename $fastqR1 _1.fq.gz)/"; 

	# run rsem
	mkdir "RNASEQ_data/rsem.$(basename $fastqR1 _1.fq.gz)";
	$RSEM/rsem-calculate-expression --bam --no-bam-output -p 5 \
	--paired-end \
	--forward-prob 0 \
	RNASEQ_data/$(basename $fastqR1 _1.fq.gz)/Aligned.toTranscriptome.out.bam \
	$GENOMEDIR/rsem/rsem \
	RNASEQ_data/rsem.$(basename $fastqR1 _1.fq.gz)/rsem; 
done

