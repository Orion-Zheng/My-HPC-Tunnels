#!/bin/bash
#SBATCH -J test_h100_mig_ddp       # Job name
#SBATCH -p gpu-long          # Queue (partition) name
#SBATCH -N 2               # Total # of nodes (must be 1 for serial)
#SBATCH --ntasks-per-node=1               # Total # of mpi tasks (should be 1 for serial)
#SBATCH -t 5:00:00        # Run time (hh:mm:ss)
#SBATCH --mem=784GB     # min mem per node
#SBATCH --gpus-per-node=h100-47:4
#SBATCH --mail-user=zheng_zian@u.nus.edu
#SBATCH --mail-type=all    # Send email at begin and end of job


# ACTIVATE YOUR PYTORCH ENV 
source ~/.bashrc
conda activate hf_gpu_dev

# Prepare Minist Dataset
python download_minist.py

# Obtain the default NIC Name
DEFAULT_NIC_NAME=$(ip route show default | grep -Po '(?<=dev )(\S+)')
export GLOO_SOCKET_IFNAME=$DEFAULT_NIC_NAME
export GLOO_LOG_LEVEL=DEBUG
export MASTER_PORT=9999
export MASTER_ADDR=$(ip addr show $DEFAULT_NIC_NAME | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "MASTER_ADDR="$MASTER_ADDR

export MIG_PER_NODE=$(nvidia-smi -L | grep MIG | wc -l)  # MIG Devices per node
# 1. Single Node Multi GPU
# export WORLD_SIZE=$MIG_PER_NODE 
# 2. Multi Node Multi GPU
export WORLD_SIZE=$(($SLURM_NNODES * $MIG_PER_NODE))
echo "WORLD_SIZE="$WORLD_SIZE

N_NODE=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | wc -l)
NODE_LIST_COMMA=$(echo "$(scontrol show hostnames "$SLURM_JOB_NODELIST")" | tr '\n' ',' | sed 's/,$//')
srun -N $N_NODE --ntasks-per-node=1 -w $NODE_LIST_COMMA bash run_multi_mig.sh

wait