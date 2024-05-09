#!/bin/bash

#SBATCH -J launch_a100_server       # Job name
#SBATCH -p long          # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 1               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --mem=100000MB     # min mem per node
#SBATCH --gpus-per-node=a100-80:1
#SBATCH --mail-user=reflectionie@gmail.com
#SBATCH --mail-type=all    # Send email at begin and end of job
source ~/.bashrc
conda activate base
nvidia-smi
python ../launch_tunnel.py --type soc_gpu
