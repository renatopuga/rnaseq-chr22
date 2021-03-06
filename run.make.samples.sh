mkdir -p input
cd input

../apps/RSEM/rsem-simulate-reads ../reference/rsem/rsem /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.stat/rsem.model /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.isoforms.results 0.2 50000 A01

../apps/RSEM/rsem-simulate-reads ../reference/rsem/rsem /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.stat/rsem.model /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.isoforms.results 0.22 50000 A02

../apps/RSEM/rsem-simulate-reads ../reference/rsem/rsem /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.stat/rsem.model /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.isoforms.results 0.25 50000 A03

../apps/RSEM/rsem-simulate-reads ../reference/rsem/rsem /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.stat/rsem.model /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.isoforms.results 0.3 50000 B01

../apps/RSEM/rsem-simulate-reads ../reference/rsem/rsem /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.stat/rsem.model /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.isoforms.results 0.32 50000 B02

../apps/RSEM/rsem-simulate-reads ../reference/rsem/rsem /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.stat/rsem.model /scratch/projects/aguiar/RNASEQ_data/rsem.PK01/rsem.isoforms.results 0.35 50000 B03

