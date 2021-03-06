## Gitpod RNAseq STAR pipeline - chr22 simulado

* Pré-requisito instalar o R

```bash
brew install r
```

## Download dos Apss (STAR e RSEM)
STAR e RSEM para alinhamento e contagem de reads.

> Execudando o script `run.dow.apps.sh`
```bash
sh run.dow.apps.sh 
```
## Indexar a referência do `chr22`.

> Executando 
```bash
cd reference
sh makeRef.sh
```

## Executar o STAR e RSEM

> Executando 
```bash
sh run.star.rsem.sh
```
