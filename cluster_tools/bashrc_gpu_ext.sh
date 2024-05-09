# cat bashrc_gpu_ext.sh >> ~/.bashrc
ENABLE_GPU_ENV_SCRIPT=""  # path to `enable_xxx_gpu_env.sh`
if nvidia-smi &> /dev/null; then
		echo "NVIDIA GPU detected, activating gpu_dev environment..."
		source $ENABLE_GPU_ENV_SCRIPT
else
		echo "NVIDIA GPU not detected, skipping..."
fi