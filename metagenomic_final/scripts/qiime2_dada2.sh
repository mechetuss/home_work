#!/bin/bash
#SBATCH --job-name=qiime2_dada
#SBATCH --partition=IXG6154-AI-common
#SBATCH --cpus-per-task=20
#SBATCH --mem=20gb
#SBATCH --time=01:00:00
#SBATCH --output=JobName.%j.log

source $HOME/miniconda3/etc/profile.d/conda.sh
conda activate qiime2
cd ~/metagenome

qiime dada2 denoise-single \
  --i-demultiplexed-seqs qza/soil_reads.qza \
  --p-trim-left 25 \
  --p-trunc-len 200 \
  --p-max-ee 3 \
  --p-n-threads 20 \
  --p-pooling-method "pseudo" \
  --p-chimera-method "consensus" \
  --p-min-fold-parent-over-abundance 4 \
  --o-table qza/soil_ASV_table.qza \
  --o-representative-sequences qza/soil_rep_seq.qza \
  --o-denoising-stats qza/soil_reads.dada2.stats.qza
