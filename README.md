## Gitpod RNAseq STAR pipeline - chr22 simulado

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/renatopuga/rnaseq-chr22)

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://github.com/renatopuga/rnaseq-chr22/notebooks/rnaseq-ch22.ipynb)


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
head merge-table-STAR-gene-level-5-50x.txt
symbol  A01     A02     A03     B01     B02     B03
AC002472.13     10      9       16      11      14      11
AC004019.13     23      16      21      16      14      16
AC004471.10     19      26      29      16      11      22
AC006547.14     91      101     81      104     91      76
AC006946.16     49      45      46      42      37      42
AC011718.2      37      34      35      25      34      25
ACR     23      11      18      13      7       16
ADORA2A-AS1     13      27      19      17      9       18
ADRBK2  624     661     640     586     575     555
```

