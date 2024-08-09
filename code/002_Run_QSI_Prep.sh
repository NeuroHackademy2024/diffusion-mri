#!/bin/bash
SUBJ=$1

# This script is for running QSIPrep in singularity, on two subjects from the HBN dataset.
# Begin by cleaning the environment. We then specify paths to the singularity image, BIDS
# formatted dataset, preprocessing output directory, and Freesurfer license.
# We also specify that we want to run on a single subject (subjectID) and give the resolution # of the raw data.

singularity run --cleanenv \
~/diffusion_project/my-qsi-prep.sif \ 
~/../../tmp/cache/data/ \ 
~/diffusion_project/results/derivatives \ 
participant \ 
--participant-label ${SUBJ} \ 
--output-resolution 1.8 \ 
--fs-license-file ~/FS_license.txt 