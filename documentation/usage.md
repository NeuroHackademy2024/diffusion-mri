# Usage

## Accessing the data

The notebooks in this repository demonstrate how to process publicly available data from Human Brain Network (HBN) in a cloud platform. The HBN dataset includes multi-modal MRI scans in BIDS format, distributed under Creative Commons, Attribution Non-Commercial Share Alike License. Further infomation about this dataset is available at [their website](https://fcon_1000.projects.nitrc.org/indi/cmi_healthy_brain_network/MRI_EEG.html). 

    /code/001-get-hbn-data_lkpo.ipynb

This notebook contains code to download data from HBN to a cloud platform, or your own local machine. 

## Running QSIprep

QSIprep can run in a shell terminal as a singularity image. The script Run_QSI_Prep.sh includes the commands used in this project, which should be modified accordingly (e.g. change the path to the FreeSurfer license following your own installation, or using the file included in this repository). Instructions to build the singularity image can be found in 'setup.md'. Once the environment has been has been prepared, the following script can be used to preprocess dMRI data with QSIprep on terminal:

`sh 002_Run_QSI_Prep.sh <SUBID>`

### QSIprep workflow
![workflow_full](https://github.com/user-attachments/assets/b630a6fc-76b3-4520-8238-eff9c0659a39)

> Cieslak, M., Cook, P.A., He, X. et al. (2021) QSIPrep: an integrative platform for preprocessing and reconstructing diffusion MRI data. Nat Methods 18 (775–778) doi: https://doi.org/10.1038/s41592-021-01185-5

The output of QSIprep includes a detailed report per participant which can be used for quality control, along with the preprocessed dMRI scan. The report includes details regarding the results of skull-stripping, tissue segmentation, co-registration with anatomical images (if available) and normalization to standard. More information regarding QSIprep can be found at [their website](https://qsiprep.readthedocs.io/en/latest/index.html). Key documents are included in this folder. 

This project strived to contribute to the interpretation of QSIprep output with a commented report available as part of this repository (Documentation QSIprep output).

### Fitting a reconstruction algorithm

`sh /code/003_Run_QSI_Recon.sh`

There are several reconstruction algorithms available in QSIprep. The above script can be used to fit an algorithm appropiate for multi-shell dMRI data. 

Different reconstruction methods were explored in this project. A short report comparing the performance of diffusion tensor imaging (DTI) and constrained spherical deconvolution (CSD) can be found at:

    /code/reconstruction/003-recon-model-comparison.ipynb
