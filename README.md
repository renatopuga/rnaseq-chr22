## Gitpod RNAseq STAR pipeline - chr22 simulado

* Pré-requisito instalar o R

```bash
brew install r
```

## Amostras Simuladas do chr22

* `A0*` : Amostras do Grupo A
* `B0*` : Amostras do Grupo B

```bash

# ir para o diretorio principal
cd /workspace/rnaseq-chr22

# listar o conteudo do diretoio input/
# A0* : Amostras do Grupo A
# B0* : Amostras do Grupo B

ls -1 input/
A01_1.fq.gz
A01_2.fq.gz
A02_1.fq.gz
A02_2.fq.gz
A03_1.fq.gz
A03_2.fq.gz
B01_1.fq.gz
B01_2.fq.gz
B02_1.fq.gz
B02_2.fq.gz
B03_1.fq.gz
B03_2.fq.gz
```

## Download dos Apps (STAR e RSEM)
STAR e RSEM para alinhamento e contagem de reads.

> Execudando o script `run.down.apps.sh`
```bash
# ir para o diretorio principal
cd /workspace/rnaseq-chr22

# rodar script de download e make da referencia chr22
sh run.down.apps.sh 
```
## Indexar a referência do `chr22`

> Executando script makeRef.sh
```bash
# ir para o diretorio principal
cd /workspace/rnaseq-chr22

# entrar no diretorio reference
cd reference

# exceutar o script bash makeRef.sh para indexing
sh makeRef.sh
```

## Executar o STAR e RSEM

> Executando script run.star.rsem.sh
```bash
# ir para o diretorio principal
cd /workspace/rnaseq-chr22

# executar STAR (mapping) e RSEM (counting) das sequencias
sh run.star.rsem.sh

# gerar as tabelas de variantes by genes e by isoforms
sh run.tables.sh
```

## Resultados - `RNASEQ_data`

```bash
# ir para o diretorio principal
cd /workspace/rnaseq-chr22

# entrar no diretório de resutlados RNASEQ_data/
# cada Amostra tem a mesma estrutura de arquivos e diretórios
RNASEQ_data/
├── A01
│   ├── Aligned.sortedByCoord.out.bam
│   ├── Aligned.toTranscriptome.out.bam
│   ├── Log.final.out
│   ├── Log.out
│   ├── Log.progress.out
│   ├── SJ.out.tab
│   ├── _STARgenome
│   │   ├── sjdbInfo.txt
│   │   └── sjdbList.out.tab
│   └── _STARpass1
│       ├── Log.final.out
│       └── SJ.out.tab

```

## Tabelas de Contagem `genes e isoforms`

```bash
# ir para o diretorio principal
cd /workspace/rnaseq-chr22

# 10x : soma de reads de todas amostras no gene é >= 10
# 50x : soma de reads de todas amostras no gene é >= 50

# listar apenas arquivo com formato .txt
ls *.txt
merge-table-STAR-gene-level-5-10x.txt
merge-table-STAR-gene-level-5-50x.txt
merge-table-STAR-transcript-level-10x.txt
merge-table-STAR-transcript-level-50x.txt

# listar 10 primeiras linhas com comando head
head merge-table-STAR-transcript-level-10x.txt
symbol  A01     A02     A03     B01     B02     B03
ABHD17AP4       5       4       5       7       10      12
ABHD17AP5       5       3       4       2       4       6
AC000078.5      6       7       7       6       3       3
AC000095.9      2       3       2       2       2       2
AC002472.13     10      9       16      11      14      11
AC004019.13     23      16      21      16      14      16
AC004019.18     0       5       6       4       3       3
AC004471.10     19      26      29      16      11      22
AC006547.13     7       12      7       5       5       7
```

