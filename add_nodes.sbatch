#!/usr/bin/env bash
#SBATCH --output=/PATH/To/THE/PROJECT/runs/%J_slurm.out
#SBATCH --error=/PATH/To/THE/PROJECT/runs/%J_slurm.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mail@mail.com
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=9
#SBATCH --mem=10GB
#SBATCH --constrain="Node_x|Node_y"
#SBATCH --array=0-3

# Check job environment
echo "JOB:  ${SLURM_JOB_ID}"
echo "TASK: ${SLURM_ARRAY_TASK_ID}"
echo "HOST: $(hostname)"
echo ""

# Activate conda
source "${HOME}/miniconda3/etc/profile.d/conda.sh"
conda activate ENV_NAME


project_name='PROJECT_NAME'
sweep_id='GIVE_YOUR_SWEEP_ID'
entity_name='GIVE_YOUR_ENTITY_NAME'
wandb login "REPLACE_WITH_YOUR_WANDB_API_KEY"
wandb agent $sweep_id --project $project_name --entity $entity_name