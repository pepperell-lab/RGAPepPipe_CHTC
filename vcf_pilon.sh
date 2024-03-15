#!/bin/bash

pilon --genome $2 --frags $1.ready.bam --output $1_pilon --variant --mindepth 10 --minmq 40 --minqual 20
