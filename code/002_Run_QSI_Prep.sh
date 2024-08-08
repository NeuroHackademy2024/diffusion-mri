#!/bin/bash
SUBJ=$1

# Running QSIPrep on two subjects from the HBN dataset.

singularity run --cleanenv \ #Cleaning the environment
~/diffusion_project/my-qsi-prep.sif \ #Path to singularity image path
~/../../tmp/cache/data/ \ #Path to BIDS formatted dataset
~/diffusion_project/results/derivatives \ #Path to output directory
participant \ #Specifying that we want to run on a single subject
--participant-label ${SUBJ} \ #Defining subjectID
--output-resolution 1.8 \ #Voxel size of data
--fs-license-file ~/diffusion_project/freesurfer/license.txt #Path to your local copy of Freesurfer license