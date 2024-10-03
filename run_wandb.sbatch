#!/usr/bin/env bash
#SBATCH --output=/PATH/To/THE/PROJECT/runs/%J_slurm.out
#SBATCH --error=/PATH/To/THE/PROJECT/runs/%J_slurm.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mail@mail.com
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=9
#SBATCH --mem=10GB
#SBATCH --constrain="Node_x|Node_y"

# Check job environment
echo "JOB:  ${SLURM_JOB_ID}"
echo "TASK: ${SLURM_ARRAY_TASK_ID}"
echo "HOST: $(hostname)"
echo ""

# Activate conda
source "${HOME}/miniconda3/etc/profile.d/conda.sh"
conda activate ENV_NAME


config_yaml='/PATH/To/THE/PROJECT/configs/params.yaml'
train_file='/PATH/To/THE/PROJECT/scripts/run.py'
project_name='PROJECT_NAME'

python -m wandb_on_slurm $config_yaml $train_file $project_name