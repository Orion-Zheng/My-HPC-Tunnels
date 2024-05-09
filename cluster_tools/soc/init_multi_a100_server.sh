#!/bin/bash

#SBATCH -J launch_a100_server       # Job name
#SBATCH -p long        # Queue (partition) name
#SBATCH -N 2               # Total # of nodes (must be 1 for serial)
#SBATCH -n 2               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 24:00:00        # Run time (hh:mm:ss)
#SBATCH --gpus-per-node=4
#SBATCH --mem=100000MB	   # min mem per node
#SBATCH --mincpus=20       # min cpu per node
#SBATCH --constraint=xgph  # xgpg: A100-40GB*1 node; xgph: A100 80GB(4*20 MIG devices)
#SBATCH --mail-user=zheng_zian@u.nus.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
source ~/.bashrc
conda activate base
nvidia-smi
python ../launch_tunnel.py --type soc_gpu
