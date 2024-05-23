#!/bin/bash
#SBATCH -J test_cpu_server       # Job name
#SBATCH -p long          # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH --ntasks-per-node=1      # total number of tasks per node
#SBATCH -t 120:00:00        # Run time (hh:mm:ss)
#SBATCH --constraint=xcnf  # CPU node, 1024 RAM, 3.84TB NVME
#SBATCH --mem=100000MB	   # min mem per node
#SBATCH --mincpus=20       # min cpu per node
#SBATCH --mail-user=zheng_zian@u.nus.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
source ~/.bashrc
python ../launch_tunnel.py --type soc_cpu
