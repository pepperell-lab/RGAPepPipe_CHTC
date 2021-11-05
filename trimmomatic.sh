#!/bin/bash

java -jar /opt/PepPrograms/Trimmomatic-0.39/trimmomatic-0.39.jar PE $1_1.fastq.gz $1_2.fastq.gz -baseout $1.fq.gz -threads 4 ILLUMINACLIP:/opt/PepPrograms/bbmap/resources/adapters.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50 
