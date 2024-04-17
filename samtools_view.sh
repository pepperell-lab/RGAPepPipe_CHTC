#!/bin/bash
samtools index $1.sam 
samtools view -bhSu $1.sam > $1.bam
