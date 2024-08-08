#!/bin/bash
SUBJ=$1

#Running QSIPrep reconstruction workflow on two subjects from HBN.

singularity run \
~/diffusion_project/my-qsi-prep.sif \ #Path to singularity image path
~/../../tmp/cache/data/ \ #Path to BIDS formatted dataset
~/diffusion_project/results/derivatives/qsirecon \ #Path to output directory
participant \ #Specifying that we want to run on a single subject
--recon_input ~/diffusion_project/results/derivatives/qsiprep \ #Path to results from QSIprep preprocessing
--recon-only \ #Specifying that we only want to run reconstruction
--recon_spec mrtrix_multishell_msmt_pyafq_tractometry \ #Specifying preconfigured reconstruction workflow that we want to use
--participant_label $SUBJ \ #Defining subjectID
--output-resolution 1.8 \ #Specify desired output resolution
--fs-license-file ~/diffusion_project/freesurfer/license.txt #Path to your local copy of Freesurfer license