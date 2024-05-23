#!/bin/bash

#SBATCH -J test_h100_server       # Job name
#SBATCH -p test          # Queue (partition) name
#SBATCH -N 2               # Total # of nodes (must be 1 for serial)
#SBATCH --ntasks-per-node=1               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --mem=784GB     # min mem per node
#SBATCH --gpus-per-node=h100-96:2
#SBATCH --mail-user=reflectionie@gmail.com
#SBATCH --mail-type=all    # Send email at begin and end of job
# source ~/.bashrc
conda activate base
nvidia-smi
python ../launch_tunnel.py --type soc_h100