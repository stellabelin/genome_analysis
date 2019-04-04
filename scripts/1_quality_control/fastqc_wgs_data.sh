#!/bin/bash

        for i in /home/stellab/private/genome_analysis/raw_data/sel3/wgs_data/*.fastq.gz
        do
                echo "Running $i ..."
                fastqc -t 1 -o /home/stellab/private/genome_analysis/results/1_quality_control/wgs_data "$i"
        done

