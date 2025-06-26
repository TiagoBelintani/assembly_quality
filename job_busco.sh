#!/bin/bash
#SBATCH -t 5:00:00            # Tempo de execução (5 horas)
#SBATCH -c 12                 # Número de CPUs

# Carregue o módulo Miniconda (ajuste se necessário)
module load miniconda/3-2023-09

# Ative o ambiente Conda apropriado
source activate /home/tiagobelintani/miniconda3/envs/stats_assembly # Troque pelo seu caminho

# Executando o BUSCO com estilo e respeito ao cluster
busco -i /home/tiagobelintani/Matheus/transcriptomas/assembly/trinity_assembly_SRR1514881.Trinity.fasta\
      -l /home/tiagobelintani/transcriptoma/busco_analises/araneae_odb12 \
      -o /home/tiagobelintani/transcriptoma/busco_analises/SRR1514881_BUSCO \
      -m transcriptome \
      -c 12 \
      --offline

