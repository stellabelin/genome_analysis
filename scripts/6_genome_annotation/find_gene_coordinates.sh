cd /home/stellab/private/genome_analysis/results/6_genome_annotation

grep "\<Name=maker-NW_015504249.1-snap-gene-16.0\>\|\<Name=maker-NW_015504249.1-snap-gene-24.2\>\|\<Name=maker-NW_015504249.1-snap-gene-21.3\>\|\
\<Name=maker-NW_015504249.1-snap-gene-6.0\>\|\<Name=maker-NW_015504249.1-snap-gene-13.1\>\|\<Name=maker-NW_015504249.1-snap-gene-5.3\>\|\
\<Name=maker-NW_015504249.1-snap-gene-18.8\>\|\<Name=snap_masked-NW_015504249.1-processed-gene-19.3\>\|\<Name=maker-NW_015504249.1-snap-gene-17.0\>\|\
\<Name=maker-NW_015504249.1-snap-gene-19.5\>\|\<Name=maker-NW_015504249.1-snap-gene-30.4\>\|\<Name=maker-NW_015504249.1-snap-gene-22.0\>\|\
\<Name=maker-NW_015504249.1-snap-gene-22.5\>\|\<Name=maker-NW_015504249.1-snap-gene-22.11\>\|\<Name=maker-NW_015504249.1-snap-gene-19.18\>\|\
\<Name=maker-NW_015504249.1-snap-gene-17.18\>\|\<Name=maker-NW_015504249.1-snap-gene-18.3\>\|\<Name=maker-NW_015504249.1-snap-gene-21.14\>\|\
\<Name=maker-NW_015504249.1-snap-gene-32.27\>\|\<Name=snap_masked-NW_015504249.1-processed-gene-32.0\>" \
unzipped_no_fasta.all.gff > gene_info.txt
grep -v "mRNA" gene_info.txt > gene_info_no_mrna.txt

