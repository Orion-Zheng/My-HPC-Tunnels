```
# Show information about all nodes in the cluster
sinfo  
# Show information only about nodes with idle CPUs
sinfo -t idle  
# Show GPU `PARTITION`, `AVAIL`, `Features` and `GRES`
sinfo -S+P -o "%18P %8a %20F %G"  
```
```
scontrol show partition
# Display specification of a specific node
scontrol show node NODE_NAME  
```
```
sacctmgr list associations
```
```
sreport cluster AccountUtilization
sreport cluster AccountUtilizationByUser user=USER_NAME
```

```
srun --pty -p gpu-long -N 2 --ntasks-per-node=1 --mem=784GB --time=2:00:00 --gpus-per-node=h100-96:2 /bin/bash
```