# p2pBandwidthLatencyTest
ref: https://gist.github.com/joshlk/bbb1aca6e70b11d251886baee6423dcb
1. View the GPU topology using 
```shell
nvidia-smi topo -m
```
2. Test p2p speed between GPUs on single node
```shell
# Download repo 
git clone https://github.com/NVIDIA/cuda-samples.git  
# Checkout the tag that corresponds with the right CUDA version
git checkout tags/v12.2  
# (Optional) You might need to install some additional packages 
sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev libglfw3-dev libgles2-mesa-dev  
# Either build everything by just execting make in root dir of cuda-samples. Or(need to specify CUDA_HOME):
cd Samples/p2pBandwidthLatencyTest;CUDA_PATH="/app/apps/cuda/12.2.2" make 
# run test
cd bin/x86_64/linux/release; ./p2pBandwidthLatencyTest
```

# NCCL Tests
1. `git clone git@github.com:NVIDIA/nccl-tests.git`
2. `cd nccl-tests`
3. `make MPI=1 MPI_HOME=/path/to/mpi CUDA_HOME=/path/to/cuda NCCL_HOME=/path/to/nccl`
For NSCC, MPI_HOME=OPENMPI_DIR (module load openmpi), NCCL_HOME=$NSCC_NCCL_DIR
make MPI=1 MPI_HOME=$OPENMPI_DIR CUDA_HOME=$CUDA_HOME NCCL_HOME=$NSCC_NCCL_DIR
Run on 8 GPUs (-g 8), scanning from 8 Bytes to 128MBytes:
./build/all_reduce_perf -b 8 -e 128M -f 2 -g 2

mpirun -np 2 ./build/all_reduce_perf -b 8 -e 128M -f 2 -g 2

For NUS SoC, 
MPI_HOME=/usr/lib/x86_64-linux-gnu/openmpi
But I didn't find NCCL 

# Accelerate Test
```accelerate test```