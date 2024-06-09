# Notice: We need to create a specific venv for GPU node, because pytorch's CPU and GPU versions are different
# conda create --name gpu_dev python=3.10
# conda activate gpu_dev
# check the cuda verion showed in the `nvidia-smi`
conda install -y pytorch==2.2.0 torchvision==0.17.0 torchaudio==2.2.0 pytorch-cuda=12.1 -c pytorch -c nvidia 
python -c "import torch; print(torch.cuda.is_available())"  # should return True
conda install -y packaging transformers datasets click dm-tree protobuf toml rich aiosignal frozenlist jsonschema astunparse
conda install -y -c conda-forge accelerate wandb peft sentencepiece deepspeed
# conda install -y -c nvidia cuda-compiler  # can skip if nvcc is installed in CUDA dir
pip install flash_attn bitsandbytes msgpack nest_asyncio pyarrow_hotfix gpustat pexpect yq
pip install -U datasets transformers
# `accelerate test` to check the availability of accelerate
# `ds_report` to check the availability of deepspeed
# install `jq` and `yq` to parse json and yaml files