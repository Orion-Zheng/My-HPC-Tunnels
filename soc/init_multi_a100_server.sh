#!/bin/bash

#SBATCH -J launch_a100_server       # Job name
#SBATCH -p long        # Queue (partition) name
#SBATCH -N 2               # Total # of nodes (must be 1 for serial)
#SBATCH --ntasks-per-node=1      # total number of tasks per node
#SBATCH -t 24:00:00        # Run time (hh:mm:ss)
#SBATCH --cpus-per-task=16        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --gpus-per-node=a100-40:1
#SBATCH --mem=100GB	   # min mem per node
#SBATCH --mail-user=zheng_zian@u.nus.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
source ~/.bashrc
conda activate base
nvidia-smi
python ../launch_tunnel.py --type soc_gpu_multi
