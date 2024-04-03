#!/bin/bash
bwa index $1
bwa mem -M -t 8 $1 $2_1P.fq.gz $2_2P.fq.gz 
