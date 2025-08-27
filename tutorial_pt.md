## Avaliação da Qualidade das Montagens de Transcriptomas

Autor: [Tiago Belintani 2025](https://tiagobelintani.github.io/)

**Objetivo**

Executar análises estatísticas de qualidade, consolidar resultados e apresentá-los em tabelas comparativas.

1. Preparação do ambiente

Inicie uma nova sessão no screen, a fim de evitar a interrupção de processos em caso de perda de conexão:

```bash
screen -S stats_assembly
```

Para reconectar-se à sessão, utilize:

```bash
screen -r stats_assembly
```

**2. Ambiente Conda**

Crie um novo ambiente dedicado às análises:

```bash 
conda create -n stats_assembly_transcriptomas \
-c conda-forge -c bioconda -c defaults \
busco python=3.11 assembly-stats
```

Ative o ambiente:
```bash
conda activate stats_assembly_transcriptomas
```

3. Geração de estatísticas com Assembly-Stats

Utilize o pacote assembly-stats para calcular métricas descritivas básicas das montagens de transcriptomas. Esses resultados constituem a primeira etapa na avaliação da qualidade e permitirão comparações entre diferentes montagens.

Quer que eu continue nesse estilo e reescreva o documento inteiro com a mesma linha acadêmica (sem perder clareza de execução dos comandos), ou prefere que eu só ajuste os trechos em que o tom está mais coloquial?



4. Gerando Estatísticas com Assembly-Stats
Para não dizer que “tudo parece ótimo”, vamos olhar os números.

Básico
```bash
assembly-stats meu_assembly.fasta
```
---
```bash
assembly-stats /home/seu_nome/sua_pasta/sub_pasta/assembly.fasta
```
---
```bash
Exemplo real:

```bash
assembly-stats /home/tiagobelintani/mepraia_2025/MEPRAIA/assembly/trinity_Mp17.Trinity.fasta
```
```bash
stats or /home/tiagobelintani/mepraia_2025/MEPRAIA/assembly/trinity_Mp17.Trinity.fasta

sum = 46745600, n = 58957, ave = 792.88, largest = 23813
N50 = 1338, n = 9576
N60 = 1012, n = 13579
N70 = 709, n = 19083
N80 = 462, n = 27294
N90 = 302, n = 39966
N100 = 169, n = 58957
N_count = 0
Gaps = 0
```

5. Tabela Comparativa 
Monte uma tabela  espécie. 

6. Rodando o BUSCO — Porque Tradicionalista Também Gosta de Novidade
Entre na pasta de trabalho:

```bash
cd transcriptoma/
```
```bash
mkdir busco_analises
```
```bahs
cd busco_analises/
```

Baixe a linhagem desejada, aqui usaremos Araneae

```bash
wget https://busco-data.ezlab.org/v5/data/lineages/araneae_odb12.2025-04-11.tar.gz
```
Descopactar
```bash
tar -xzvf araneae_odb12.2025-04-11.tar.gz
```

Rodando por meio do job

Comando basico

```bash
busco -i /home/seu_nome/seu_projeto/assembly/sua_assembly.fasta \
      -l /home/seu_nome/seu_projeto/busco_analises/araneae_odb12 \
      -o seu_assembly_BUSCO -m transcriptome -c 12 --offline
```


Acesse o arquivo job_busco.sh para obter o modelo do (job)[https://github.com/TiagoBelintani/assembly_quality/blob/main/job_busco.sh]

