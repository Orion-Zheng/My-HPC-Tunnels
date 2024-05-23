#!/bin/bash
#SBATCH -J test_a100_server       # Job name
#SBATCH -p long        # Queue (partition) name
#SBATCH -N 2               # Total # of nodes (must be 1 for serial)
#SBATCH --ntasks-per-node=1      # total number of tasks per node
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --cpus-per-task=24        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --gpus-per-node=a100-40:2
#SBATCH --mem=240G	   # min mem per node
#SBATCH --mail-user=zheng_zian@u.nus.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
source ~/.bashrc
conda activate base
nvidia-smi
python ../launch_tunnel.py --type soc_a100
