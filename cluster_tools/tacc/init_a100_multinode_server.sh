#!/bin/bash

#SBATCH -J multi_node_gpu_runtime  # Job name
#SBATCH -p gpu-a100          # Queue (partition) name
#SBATCH -N 4               # Total # of nodes (must be 1 for serial)
#SBATCH -n 4               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 48:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-user=zheng_zian@u.nus.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
start_tunnel_auto.sh
