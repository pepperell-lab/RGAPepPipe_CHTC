#!/bin/bash

export HOME=$PWD
export PATH
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

sh Miniconda3-latest-Linux-x86_64.sh -b -p $PWD/miniconda3
export PATH=$PWD/miniconda3/bin:$PATH

conda config --add channels bioconda
conda install picard=2.26.4

picard MarkDuplicates -I $1.sort.bam -O $1.dedup.bam -M $1.metrics -REMOVE_DUPLICATES true -AS true -VALIDATION_STRINGENCY SILENT

picard AddOrReplaceReadGroups -I $1.dedup.bam -O $1.ready.bam -RGID $1 -RGLB $2 -RGPL $3 -RGPU dummy-barcode -RGSM $4 -VALIDATION_STRINGENCY SILENT -SORT_ORDER coordinate -CREATE_INDEX true
