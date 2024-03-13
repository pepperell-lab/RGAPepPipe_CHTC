#!/bin/bash

qualimap bamqc -bam $1.ready.bam -outdir $1_bamqc

tar -zcvf $1.bamqc.tar.gz $1_bamqc/
