# Setting up the environment

## QSIprep

QSIprep is a pipeline for diffusion-weighted MRI (dMRI) data in BIDS format. It automatically preprocesses most kinds of dMRI data and outputs visual reports and QC metrics. Moreover, it can be used to run state-of-the-art reconstruction algorithms. 

> Cieslak, M., Cook, P.A., He, X. et al. (2021) QSIPrep: an integrative platform for preprocessing and reconstructing diffusion MRI data. Nat Methods 18 (775–778) doi: https://doi.org/10.1038/s41592-021-01185-5

### Singularity

QSIprep can be run from the cloud with a singularity container. The following line will build a singularity image from docker:

`singularity build ./my-qsi-prep.sif docker://pennbbl/qsiprep:0.22.1`

To be able to successfully preprocess data with this framework, certain files are required as per BIDS guidelines, and these are: dataset_description.json , README , participants.tsv. The files we generated are available in this repository under the [BIDS](https://github.com/NeuroHackademy2024/diffusion-mri/tree/main/documentation/BIDS) folder. It is also possible to download the files distributed along with the BIDS_curated HBN dataset. An example line of code to create an empty json file from the terminal:

`touch ~/../tmp/cache/sub-*/dataset_description.json`

