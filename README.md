# Genome Analysis

## Aim 
To characterize transcriptomic and epigenomic factors to the development of bat wings. Since bats are the only mammals with the ability to fly, studying epigenetic factors could be interesting to be able to find out the factors for that. 

## Project Plan

### Time Plan of Workflow

| Deadline   | Week | Process                               | Software                 | Estimated time    | 
| ---------- | ---- | ------------------------------------- | ------------------------ | ----------------- | 
| 04-04-2019 | 14   | Familiarize with files and UPPMAX     | --                       | 1 h               |
| 04-04-2019 | 14   | Quality check of reads                | FastQC                   | 3 min             |
| 05-04-2019 | 14   | Trimming of genomic and RNA reads     | Trimmomatic              | 1-10 min per file |
| 11-04-2019 | 15   | Genome Assembly                       | SOAPdenovo               | 1.5 h             |
| 12-04-2019 | 15   | Assembly quality assessment           | BCFtools                 | 1.5 h             |
| 24-04-2019 | 17   | Transcriptome assembly                | Trinity                  | 1.5 h             |
| 29-04-2019 | 18   | Genome annotation                     | Maker2                   | 3.5 h             |
| 02-05-2019 | 18   | Homology search                       | blastn                   | 1 h               |
| 02-05-2019 | 18   | Improve annotation with RNA assemblies| Maker2                   | 0.5-1.5 h         |
| 07-05-2019 | 19   | RNA mapping                           | TopHat                   | 5-30 min per file |            
| 13-05-2019 | 20   | Analyses of long non-coding RNAs      | See below                | --                |
| 13-05-2019 | 20   | Compare lncRNAs to databases          | lncRNAdb, GENCODE lncRNA | 1 h               |
| 13-05-2019 | 20   | Compare homogenic lncRNAs             | BLAST                    | 1 h               |
| 16-05-2019 | 20   | Calculate read counts                 | Htseq                    | 5 min             |
| 16-05-2019 | 20   | Test of differential expression       | Deseq2                   | Variable          |
| 17-05-2019 | 20   | Calculate heterozygosity of genome    | BWA                      | 1.5 h             |

### Other Deadlines
27-04-2019: Wiki is finished <br>
28-04-2019 - 29-04-2019: Presentations

## SOAPdenovo
### Parameters
- avg_ins: Based on the size of each library
- reverse_seq: If the library was paired-end it was set to 0, if mate-paired it was set to 1
- asm_flags: If the library was paired-end it was set to 0, if mate-paired it was set to 
- rd_len_cutoff: 
- rank: 
- pair_num_cutoff: 
- map_len: 
