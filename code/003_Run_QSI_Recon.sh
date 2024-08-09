#!/bin/bash
SUBJ=$1

paths_main="/home/jovyan/diffusion_project"
paths_data="${paths_main}/data"
paths_derivatives="${paths_main}/results/derivatives"
paths_files="${paths_main}/freesurfer"

#Running QSIPrep reconstruction workflow on two subjects from HBN.
singularity run \
    --bind "${paths_data}:/data" \
    --bind "${paths_derivatives}:/out" \
    --bind "${paths_files}:/files" \
    /home/jovyan/diffusion_project/my-qsi-prep.sif \
    /data /out participant \
    --recon-input /out/qsiprep \
    --recon-only \
    --recon-spec mrtrix_multishell_msmt_pyafq_tractometry \
    --participant-label $SUBJ \
    --fs-license-file /files/license.txt
