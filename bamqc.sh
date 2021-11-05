#!/bin/bash

/opt/PepPrograms/qualimap_v2.2.1/qualimap bamqc -bam $1.ready.bam -outdir $1_bamqc

tar -zcvf $1.bamqc.tar.gz $1_bamqc/
