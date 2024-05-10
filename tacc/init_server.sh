#!/bin/bash

#SBATCH -J launch_cpu_runtime  # Job name
#SBATCH -p vm-small          # Queue (partition) name
#SBATCH -N 1               # Total # of nodes (must be 1 for serial)
#SBATCH -n 1               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 12:00:00        # Run time (hh:mm:ss)
#SBATCH --mail-user=zheng_zian@u.nus.edu
#SBATCH --mail-type=all    # Send email at begin and end of job
start_tunnel_auto.sh
