#!/bin/bash
#SBATCH --job-name=eval_llama3_8B_dora_r16                     # task name
#SBATCH --time=5:00:00                                               # maximum time (D-HH:MM:SS, 2-00:00:00)
#SBATCH --mem=50G                                                       # memory requirement
#SBATCH --cpus-per-task=5                                              # number of CPU cores
#SBATCH --gpus=nvidia_h100_80gb_hbm3_2g.20gb:1                                          # GPU requirement
#SBATCH --output=slurm_logs/%x/%A.out           # standard output file (%A=jobID, %a=arrayID)
#SBATCH --error=slurm_logs/%x/%A.err            # error output file
#SBATCH --mail-type=ALL                                                 # send email at begin and end of job
#SBATCH --mail-user=hwan783@uwo.ca                                      # email address
#SBATCH --account=def-atrisha


module purge
module load gcc arrow/17.0.0
module load python/3.10 cuda

# Activate pre-built Python venv  
cd /home/hwan783/scratch/homework/DoRA/commonsense_reasoning
source dora_com_venv/bin/activate

# show GPU info
nvidia-smi

# run the script
# Evaluate models
# export HUGGINGFACE_HUB_TOKEN=YOUR HUGGINGFACE TOKEN
sh ./scripts/llama3_8B_Dora_eval.sh ./finetuned_result/llama3_8B/dora_r16 0