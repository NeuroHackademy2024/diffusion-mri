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

https://docs.google.com/presentation/d/1gBYgj7bvX_WXeWhLaaVascgVg11U0I21FMfHWdSCMzU/edit#slide=id.g27fadbbc47c_2_0 

## Running QSIprep preprocessing pipeline

1. Get the data: `/code/001-get-hbn-data_lkpo.ipynb`
   - Make sure to have `utilities.py` under `/code/`
   - Make sure to have `data_description.json` under the BIDS dataset folder
   - You will need a txt file with the FS_license
   - Make sure that fmaps belong to the dwi images. We removed the fMRI fmaps
3. Run QSIprep preprocessing: `/code/002_Run_QSI_Prep.sh`
   - On Terminal: `sh 002_Run_QSI_Prep.sh <SUBID>`
4. Run QSIprep reconstruction `/code/003_Run_QSI_Recon.sh`
  
   

## More info

For more information regarding the present project and instructions to use the jupyter notebooks, visit the [documentation page in this repository](https://github.com/NeuroHackademy2024/diffusion-mri/tree/main/documentation).

