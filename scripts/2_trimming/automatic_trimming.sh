#!/bin/bash
declare -i counter
counter=0
	for i in /home/stellab/private/genome_analysis/raw_data/sel3/wgs_data/*.fastq.gz
		do
			echo "Firt part is working"
			echo "$counter"

		if [ $((counter % 2)) == 0 ]; then          			
			echo "Running $i ..."
			echo "$((i+1))"
			j=$((i+1))
			echo "This works too"
                	echo "Running ${!j} ..."
		fi
		let counter++
		done
