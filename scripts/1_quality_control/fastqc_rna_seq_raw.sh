#!/bin/bash

        for i in /home/stellab/private/genome_analysis/raw_data/sel3/rna_seq_data/raw/*.fastq.gz
        do
                echo "Running $i ..."
                fastqc -t 1 -o /home/stellab/private/genome_analysis/results/1_quality_control/rna_seq_data/raw "$i"
        done

