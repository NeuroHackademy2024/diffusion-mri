# %% Testing nibabel to look at metadata

# set BIDS variables
bids_path   = 'your/path/to/the/BIDS/directory'
bids_sub    = 'test01'
bids_ses    = 'dmri01'
bids_acq    = 'diadem'
bids_rec    = 'gncd'
bids_run    = '01'

# set paths to directories
import os.path as op
anat_dir    = op.join(bids_path, f'sub-{bids_sub}', f'ses-{bids_ses}', 'anat')
dwi_dir     = op.join(bids_path, f'sub-{bids_sub}', f'ses-{bids_ses}', 'dwi')

# # perhaps set a directory for outputs?
# out_dir     = op.join(bids_path, 'derivatives', 'recon')

# Set file names
t1w_fname   = op.join(anat_dir, f'sub-{bids_sub}_ses-{bids_ses}_T1w.nii')
base_dMRI_name = op.join(dwi_dir, f'sub-{bids_sub}_ses-{bids_ses}_acq-{bids_acq}_rec-{bids_rec}_run-{bids_run}_dwi')
dwi_fname   = f'{base_dMRI_name}.nii.gz'
bval_fname  = f'{base_dMRI_name}.bval'
bvec_fname  = f'{base_dMRI_name}.bvec'

# %% Let’s start loading the dMRI data, which are 4D array containing:
# Three dimensions i, j, k (voxel coordinates)
# Last dimension is the number of non-weighted (S0s) & diffusion-weighted volumes
import nibabel as nib
dwi_nii     = nib.load(dwi_fname)
dwi_data    = dwi_nii.get_fdata()
dwi_hdr     = dwi_nii.header
type(dwi_data)

t1_nii  = nib.load(t1w_fname)
t1_data = t1_nii.get_fdata()
t1_hdr  = t1_nii.header
type(t1_data)

# returns data size &  dimensions of each voxel
print('T1w')
print('shape:')
print(t1_nii.shape)
print('voxel dimensions:')
print(t1_nii.header.get_zooms()[:3])   # 1 mm
print('')
print('dMRI')

print('shape:')
print(dwi_nii.shape)
print('voxel dimensions:')
print(dwi_nii.header.get_zooms()[:3])   # 2 mm
# %%

# # perhaps figure how to plot the results
# import matplotlib.pyplot as plt (?)


# %% # get bvals and bvecs in a diffusion gradient table
from dipy.io import read_bvals_bvecs
from dipy.core.gradients import gradient_table
bvals, bvecs = read_bvals_bvecs(bval_fname, bvec_fname)
gtab = gradient_table(bvals, bvecs)
# Show gradient table info & bvals
print('Gradients table info')
print(gtab.info)

# %%
# perhaps look into the values to see is single or multishell acq?
print('')
print('Take a look at the gradients:')
print('Are these data single or multi-shell?')
print('B-values')
print(gtab.bvals)

# not bad to see the directions as well
print('')
print('B-vectors')
print(gtab.bvecs[:25, :])

