# definindo diretório onde as amostras *abundance.tsv
args <- commandArgs(TRUE)

#aligned
nameDir <- args[1]

# definir a coluna onde começa o sinal de expressão ou contagem
colExps <- as.numeric(args[2])

# output file
output  <- args[3]

setwd(nameDir)

# listar os nomes dos arquivos 
nomeArqs <- dir()

# abrir um arquivo e armazenar seu conteúdo
umArq <- read.delim(nomeArqs[1])
#umArq <- read.delim(nomeArqs[1], skip=4, header=FALSE)

# abrir todos os arquivos e armazenar apenas o sinal de expressão
vals <- sapply(nomeArqs, function(x) read.delim(x)[,colExps])

# adicionar nomes nas colunas da variável (vals)
colnames(vals) <- nomeArqs

# adicionar todas as colunas informativas
table <- data.frame("gene_id"=umArq[,1],vals)

# arquivo de anotação (transcript -> gene)
annot <- read.delim("/content/rnaseq-chr22/Transcript2Symbol.txt")

# adicionando o nome do gene
table_annot <- merge(annot, table, by.x=1, by.y=1, all=FALSE)
table_annot_sum <- aggregate(table_annot[,-c(1:2)], by=list(symbol=table_annot$symbol), sum)

# pegar as linhas onde a soma der zero
x10 <- apply(table_annot_sum[, -c(1)], 1, function(x) { sum(x)<10  } )
x50 <- apply(table_annot_sum[, -c(1)], 1, function(x) { sum(x)<50  } )

# remove as linhas de soma zero
transcript_x10 <- table_annot_sum[ !x10,]
transcript_x50 <- table_annot_sum[ !x50,]


# salvando arquivo
write.table(transcript_x10, paste("../merge-table-STAR-",output,"-10x.txt",sep=""), quote=FALSE, row.names=FALSE, sep='\t')
write.table(transcript_x50, paste("../merge-table-STAR-",output,"-50x.txt",sep=""), quote=FALSE, row.names=FALSE, sep='\t')

