#!/bin/bash
#
#SBATCH --job-name=dmriprep_noeddy
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=50GB
#SBATCH --time=48:00:00
#SBATCH --mail-type=END
#SBATCH --mail-user=qy775@nyu.edu
#SBATCH --output=out_dmriprep/slurm%j.out


#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
# Parameters needed for running the code
#<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
set -x
SUBJ=$1        # subject initials, eg: 5977



singularity run --cleanenv \
/share/apps/cbi/singularity/nipreps/dmriprep_latest.sif \
/scratch/projects/hartleylab/crcns/data/mri/duplicates/sub-${SUBJ} \
/scratch/projects/hartleylab/crcns/data/mri/duplicates/sub-${SUBJ}/derivatives \
--skip-bids-validation \
participant \
--participant-label ${SUBJ} \
--fs-license-file /share/apps/cbi/BIDS/etc/FS_license.txt \
