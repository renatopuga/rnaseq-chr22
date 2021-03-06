## Gitpod RNAseq STAR pipeline - chr22 simulado

* Pré-requisito instalar o R

```bash
brew install r
```

## Download dos Apss (STAR e RSEM)
STAR e RSEM para alinhamento e contagem de reads.

> Execudando o script `run.down.apps.sh`
```bash
sh run.down.apps.sh 
```
## Indexar a referência do `chr22`

> Executando script makeRef.sh
```bash
cd reference
sh makeRef.sh
```

## Executar o STAR e RSEM

> Executando script run.star.rsem.sh
```bash
sh run.star.rsem.sh
```
