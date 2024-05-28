#!/bin/bash
train_log_dir="train_log"  # Set the log directory name
MIG_DEVICES_LIST=$(nvidia-smi -L | grep -Eo 'MIG-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+-[a-f0-9]+' | sort -u)
# Create the log directory if it doesn't exist
if [ ! -d "$train_log_dir" ]; then
    mkdir "$train_log_dir"
fi

index=0
for UUID in $MIG_DEVICES_LIST
do
    GLOBAL_RANK=$((SLURM_NODEID * MIG_PER_NODE + index))
    LOG_FILE="${train_log_dir}/log_${GLOBAL_RANK}.txt"  # Update the LOG file path
    echo "Node: $SLURM_NODEID Index: $index, UUID: $UUID, Rank: $GLOBAL_RANK"
    CUDA_VISIBLE_DEVICES="$UUID" GLOBAL_RANK="$GLOBAL_RANK" python mnist_classify_ddp_mig.py > "$LOG_FILE" &
    ((index++))
done

wait