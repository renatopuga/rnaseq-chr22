## Gitpod RNAseq STAR pipeline - chr22 simulado

## Download dos Apss (STAR e RSEM)

```bash
mkdir -p apps
cd apps
wget -c https://github.com/alexdobin/STAR/archive/2.7.8a.tar.gz
tar -zxvf 2.7.8a.tar.gz

wget -c https://github.com/deweylab/RSEM/archive/v1.3.3.tar.gz
tar -zxvf v1.3.3.tar.gz
```

## Execudando script `run.dow`
```bash
sh run.dow.apps.sh 
```
