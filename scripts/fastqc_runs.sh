#!/bin/bash

        for i in /home/stellab/private/genome_analysis/raw_data/sel3/wgs_data/*.fastq.gz
        do
                echo "Running $i ..."
                fastqc -t 1 -o . "$i"
        done

