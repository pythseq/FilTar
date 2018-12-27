configfile: "config/accession_mappings.yaml"
configfile: "config/matedness.yaml"
configfile: "config/species_basic.yaml"
configfile: "config/species_sequencing.yaml"

include: "sub_snakemake/data_download/ENA/Snakefile"
#include: "sub_snakemake/qc/Snakefile"
include: "sub_snakemake/data_download/Snakefile"
include: "sub_snakemake/quant_reads/Snakefile"
include: "sub_snakemake/trim_reads/trim_galore/Snakefile"
include: "sub_snakemake/map_reads/hisat2/Snakefile"
include: "sub_snakemake/APAtrap/Snakefile"
include: "sub_snakemake/reannotate_3utrs/Snakefile"
include: "sub_snakemake/quant_reads/salmon/Snakefile"
include: "sub_snakemake/mirna/Snakefile"
include: "sub_snakemake/target_prediction/targetscan/Snakefile"
include: "sub_snakemake/get_utr_and_cds/Snakefile"
include: "sub_snakemake/target_prediction/miRanda/Snakefile"
include: "sub_snakemake/create_tables/SQLite/Snakefile"
include: "sub_snakemake/upload_to_tables/SQLite/Snakefile"
include: "sub_snakemake/upload_to_tables/Snakefile"
include: "sub_snakemake/profiling/Snakefile"
include: "sub_snakemake/canonical_targets/Snakefile"

wildcard_constraints:
    species="[a-z]{3,4}",
    tissue="((?!chr([A-Z]|\d)).)*", # pattern to ensure tissue wildcard does not contain the following pattern: chr[0-9] or chr[A-Z]
    chrom="[A-Za-z-9]{1,2}"

rule all:
     input: #expand("results/{accession}.bam.sorted", accession=config['all_brain_runs']), 
            #expand("data/{accession}.fastq.gz", accession=config['projects']['human']['PRJEB4337']),
            #expand("data/paired_end/{accession}_1.fastq.gz", accession=config['projects']['human']['paired-end']['PRJEB4337']),
            #expand("data/paired_end/{accession}_2.fastq.gz", accession=config['projects']['human']['paired-end']['PRJEB4337']),
            #expand("results/{accession}_trimmed.fq.gz", accession=config['all_single_end']),
            #expand("results/{accession}_1_val_1.fq.gz", accession=config['all_paired_end']),
            #expand("results/{accession}_2_val_2.fq.gz", accession=config['all_paired_end']),
            #expand("results/{accession}.bedgraph", accession=config['all_brain_runs']),
            #expand("results/{accession}.utr.bed", accession=config['tmp']),
            #expand("results/{accession}_salmon/", accession=config['all_single_end']),
            #expand("results/{accession}.bedgraph", accession=config['tmp']),
            #expand("results/{accession}.utr.full.bed", accession=config['tmp'])
            #expand("results/paired_end_salmon/{accession}/", accession=config['sample_type']['human']['adipose_tissue']['paired_end']),
            #expand("results/single_end_salmon/{accession}/", accession=config['sample_type']['human']['adipose_tissue']['single_end']),
            #expand("results/{tissue}_avg.sf", tissue=config['sample_type']['human']['all_tissues']),
            #expand("results/bam/paired_end/{accession}.sam", accession=config['all_paired_end_human']),
            #expand("results/bam/single_end/{accession}.sam", accession=config['all_single_end_human'])
	    #expand("results/bam/paired_end/{accession}.bam.sorted", accession=config['all_paired_end_human']),
            #expand("results/bam/single_end/{accession}.bam.sorted", accession=config['all_single_end_human']),
            #expand("results/hsa_chr{chrom}_msa.branch_lengths.tsv", chrom=config['chromosomes']['human'])
            #expand("results/hsa_CDS_chr{chrom}.tsv", chrom=config['chromosomes']['human'])
