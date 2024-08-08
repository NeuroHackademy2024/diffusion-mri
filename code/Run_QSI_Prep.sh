#!/bin/bash
SUBJ=$1

# Running QSIPrep on two subjects from the HBN dataset.

singularity run --cleanenv \
~/diffusion_project/my-qsi-prep.sif \
~/../../tmp/cache/data/ \
~/diffusion_project/results/derivatives \
participant \
--participant-label ${SUBJ} \
--output-resolution 1.8 \
--fs-license-file ~/diffusion_project/freesurfer/license.txt #Path to your local copy of Freesurfer license