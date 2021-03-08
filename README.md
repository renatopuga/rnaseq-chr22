## Gitpod RNAseq STAR pipeline - chr22 simulado

* Pré-requisito instalar o R

```bash
brew install r
```

## Download dos Apps (STAR e RSEM)
STAR e RSEM para alinhamento e contagem de reads.

> Execudando o script `run.down.apps.sh`
```bash
# voltar para o diretorio principal
cd /workspace/rnaseq-chr22

# rodar script de download e make da referencia chr22
sh run.down.apps.sh 
```
## Indexar a referência do `chr22`

> Executando script makeRef.sh
```bash
# voltar para o diretorio principal
cd /workspace/rnaseq-chr22

# entrar no diretorio reference
cd reference

# exceutar o script bash makeRef.sh para indexing
sh makeRef.sh
```

## Executar o STAR e RSEM

> Executando script run.star.rsem.sh
```bash
# voltar para o diretorio principal
cd /workspace/rnaseq-chr22

# executar STAR (mapping) e RSEM (counting) das sequencias
sh run.star.rsem.sh

# gerar as tabelas de variantes by genes e by isoforms
sh run.tables.sh
```
