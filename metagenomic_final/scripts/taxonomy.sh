#!/bin/bash
#SBATCH --job-name=qiime2_taxonomy
#SBATCH --partition=IXG6154-AI-common
#SBATCH --cpus-per-task=16
#SBATCH --mem=40gb
#SBATCH --time=02:00:00
#SBATCH --output=Taxonomy.%j.log

source $HOME/miniconda3/etc/profile.d/conda.sh
conda activate qiime2
cd ~/metagenome

qiime feature-classifier classify-sklearn \
  --i-classifier /home/STUDY/FBMF/bioinformatics/metagenomes/soil_hw/2022.10.backbone.v4.nb.sklearn-1.4.2.qza \
  --i-reads qza/soil_rep_seq.qza \
  --o-classification qza/soil_taxonomy.qza \
  --p-n-jobs 16
