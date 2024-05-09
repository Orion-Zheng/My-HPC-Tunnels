# Load modules(such as cuda cudnn nccl, if any); Set ENV Variables; Activate Conda Env, ...
module load cuda/12.0 cudnn/8.8.1 nccl/2.17.1
export CUDA_HOME=$TACC_CUDA_DIR
conda activate gpu_dev
