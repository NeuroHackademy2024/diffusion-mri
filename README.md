# diffusion-mri
This projects contains code to download and process diffusion data from Healthy Brain Network with QSIprep and other tools.

Project for [Neurohackacademy 2024](https://github.com/NeuroHackademy2024). Contributors:

* [Allesandra Iadipaolo](https://github.com/aiadipaolo)
* [Gabriela Ojeda  Valencia](https://github.com/Ojvagab)
* [Qingqing Yang](https://github.com/Qingqing-Yang-177)
* [Claudia Tato Fernández](https://github.com/TatoCl)
* [Lya K. Paas](https://github.com/lilikapa)
* [Elle Murata](https://github.com/emucsb)
* [Lupita Yáñez Ramos](https://github.com/Lupitayanez)
* [Luis A.](https://github.com/LuisA00)

## Background information about Diffusion Imaging

[A Short Introduction to Diffusion MRI](https://docs.google.com/presentation/d/1gBYgj7bvX_WXeWhLaaVascgVg11U0I21FMfHWdSCMzU/edit#slide=id.g27fadbbc47c_2_0)

## Running QSIprep preprocessing pipeline

1. Get the data: `/code/001-get-hbn-data_lkpo.ipynb`
   - Make sure to have `utilities.py` under `/code/`
   - We worked with the unprocessed data under `BIDS_curated` folder. Each subject should have an `anat`, `dwi` and `fmap` folder. 
   - Data should be downloaded to a `data` folder to comply with BIDS format
   - Make sure to have `data_description.json` under the BIDS dataset folder (You can find it under `/code/dataset_description.json`).
   - You will need a txt file with the FS_license
   - Make sure that fmaps belong to the dwi images. We removed the fMRI fmaps manually: `rm -rf /tmp/cache/data/sub-*/*/*fmri*`
3. Run QSIprep preprocessing: `/code/002_Run_QSI_Prep.sh`
   - Create singularity image in `diffusion_mri` folder by typing on terminal:
      - `singularity build ./my-qsi-prep.sif docker://pennbbl/qsiprep:0.22.1`
   - To run the script do on Terminal: `sh 002_Run_QSI_Prep.sh <SUBID>`
   - Modify all paths according to
     1. singularity image
     2. BIDS formatted `data` directory
     3. Output directory
     4. No need to modify subject id within the script
     5. Look at acquisition parameters to obtain the voxel resolution or modify according to desired voxel size
     6. Point to your freesurface license
   - After it is done, manually inspect the HTML and figures files for each subject
4. Run QSIprep reconstruction `/code/003_Run_QSI_Recon.sh`
   - To run the script do on Terminal: `sh 003_Run_QSI_Recon.sh <SUBID>`
   - Modify all paths according to
      1. Singularity image
      2. BIDS formatted `data` directory
      3. Output directory with qsirecon
      4. Input directory with the qsiprep outputs from the previous step
      5. Specify the reconstruction model you want to use. For reference: https://qsiprep.readthedocs.io/en/latest/reconstruction.html
      6. Look at acquisition parameters to obtain the voxel resolution or modify according to desired voxel size
      7. Point to your freesurface license

## More info

For more information regarding the present project and instructions to use the jupyter notebooks, visit the [documentation page in this repository](https://github.com/NeuroHackademy2024/diffusion-mri/tree/main/documentation).

