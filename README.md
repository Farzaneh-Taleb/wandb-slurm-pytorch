
# wandb-slurm-pytorh

This respository is a template to configure wandb for a pytorh project that is supposed to be run as an job-array in slurm.


## Preparation

- **Modify params.yaml**
- **Modify add_nodes.sbatch and run_wandb.sbatch**
- **Modify run.py** 
- **Modify wandb_on_slurm.py**


## Usage/Examples

First you need to run run_wandb.sbatch using the following command

```bash
sbatch run_wandb.sbatch
```

Then wait for the process to run and get a sweep id. Then copy the swing_id in the add_nodes.sbatch and run the following:


```bash
sbatch add_nodes.sbatch
```

