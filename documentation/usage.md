# Usage

## Accessing the data

The notebooks in this repository demonstrate how to process publicly available data from Human Brain Network (HBN) in a cloud platform. The HBN dataset includes multi-modal MRI scans in BIDS format, distributed under Creative Commons, Attribution Non-Commercial Share Alike License. Further infomation about this dataset is available at [their website](https://fcon_1000.projects.nitrc.org/indi/cmi_healthy_brain_network/MRI_EEG.html). 

The first notebook includes code to download data from HBN to a cloud platform, or your own local machine. 

## Running QSIprep

This project demonstrates how to preprocess diffusion MRI (dMRI) data with QSIprep, an automated pipeline. QSIprep will be run from the terminal as a singularity image. The script Run_QSI_Prep.sh includes the commands used in this project, which should be modified accordingly (e.g. change the path to the FreeSurfer license following your own installation, or using the file included in this repository). Instructions to build the singularity image can be found in 'setup.md'. Once the environment has been has been prepared, QSIprep can be ran from the terminal as follows:

`sh Run_QSI_Prep.sh ID`

The output of QSIprep includes a detailed report per participant which can be used for quality control, along with the preprocessed dMRI scan. The report includes details regarding the results of skull-stripping, tissue segmentation, co-registration with anatomical images (if available) and normalization to standard. More information regarding QSIprep can be found at [their website](https://qsiprep.readthedocs.io/en/latest/index.html). Key documents are included in this folder. 

## Fitting a reconstruction algorithm

