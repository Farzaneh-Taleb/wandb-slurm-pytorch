
# wandb-slurm-pytorh

This respository is a template to configure wandb for a pytorh project that is supposed to be run as an job-array in slurm.


## Preparation

- **Modify params.yaml**
Define different parameters that will be accessible through args object later. If you wish to try different values per variable, you can define it as "values" instead of "value".
- **Modify add_nodes.sbatch and run_wandb.sbatch**
Change these files according to the specifications of your project.
- **Modify run.py**
Replace your api_key. Also, log the variables that you want to check later in wandb console.
- **Modify wandb_on_slurm.py**
Replace your api_key and change other specifications if you need to

## Usage/Examples

1) First you need to run run_wandb.sbatch using the following command

```bash
sbatch run_wandb.sbatch
```


2) (Do this step if you want to run multiple jobs in parallel) Then wait for the process to run and get a sweep id. Then copy the sweep_id in the add_nodes.sbatch and run the following:


```bash
sbatch add_nodes.sbatch
```

