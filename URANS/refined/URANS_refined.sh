#!/bin/bash -l
       
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1          
#SBATCH --time=20:00:00 
#SBATCH --job-name=URANS_refined
#SBATCH --export=NONE
#SBATCH --mail-user=ashif.poothanali@fau.de
#SBATCH --mail-type=ALL

unset SLURM_EXPORT_ENV 

# load environment module 
module purge
module load openfoam-org/10.0

# Go to the case directory
cd /home/woody/stvl/stvl102h/OpenFOAM/practical/URANS/refined



# Please insert here your preferred solver executable! 
pisoFoam | tee log.residual