#!/bin/bash
#SBATCH --job-name=qiime2_div
#SBATCH --partition=IXG6154-AI-common
#SBATCH --cpus-per-task=16
#SBATCH --mem=40gb
#SBATCH --time=03:00:00
#SBATCH --output=Diversity.%j.log

source $HOME/miniconda3/etc/profile.d/conda.sh
conda activate qiime2
cd ~/metagenome

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences qza/soil_rep_seq.qza \
  --p-n-threads 16 \
  --o-alignment qza/aligned_soil_rep_seq.qza \
  --o-masked-alignment qza/masked_aligned_soil_rep_seq.qza \
  --o-tree qza/soil_unrooted_tree.qza \
  --o-rooted-tree qza/soil_rooted_tree.qza

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny qza/soil_rooted_tree.qza \
  --i-table qza/soil_ASV_table.qza \
  --p-sampling-depth 4800 \
  --m-metadata-file soil_metadata_full.tsv \
  --output-dir soil_core_metrics_results
