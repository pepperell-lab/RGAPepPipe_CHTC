#!/bin/bash

##this script generates an html report for all of the QC files from RGA pep pipeline.

echo "installing miniconda..."
export HOME=$PWD
export PATH
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

sh Miniconda3-latest-Linux-x86_64.sh -b -p $PWD/miniconda3
export PATH=$PWD/miniconda3/bin:$PATH

##Adding channels
echo "adding channels..."
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict

echo "installing multiqc..."
conda install multiqc

echo "tar multiQC ..."
tar -xzf multiQC-2.tar.gz
cd multiQC-2

echo "untaring bamqc..."
for f in *bamqc.tar.gz; do tar -xzf $f; done

echo "running multiqc..."
multiqc -ds .

mv multiqc_report.html multiqc_data/
mv multiqc_data/ multiQC-2-report
tar -czvf multiqc-2-report.tar.gz multiQC-2-report/
mv multiqc-2-report.tar.gz ../
