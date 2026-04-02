#!/bin/bash
#SBATCH --job-name=dora_llama7b_finetuning                              # task name
#SBATCH --time=2-12:00:00                                               # maximum time (D-HH:MM:SS)
#SBATCH --mem=80G                                                       # memory requirement
#SBATCH --cpus-per-task=10                                              # number of CPU cores
#SBATCH --gpus-per-node=h100:8                                          # GPU requirement
#SBATCH --output=logs/dora_llama7b_finetuning/%A.out                    # standard output file (%A=jobID, %a=arrayID)
#SBATCH --error=logs/dora_llama7b_finetuning/%A.err                     # error output file
#SBATCH --mail-type=ALL                                                 # send email at begin and end of job
#SBATCH --mail-user=hwan783@uwo.ca                                      # email address
#SBATCH --account=def-urehman6


module purge
module load gcc arrow/17.0.0
module load python/3.10 cuda 

cd /home/hwan783/scratch/project/DoRA/visual_instruction_tuning
source dora_com_venv/bin/activate

# you should download the dataset and the base model following the instructions in the official readme file
# finetuning with 8 H100 GPUs
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 bash ./Dora_7b.sh

# evaluating with 8 H100 GPUs
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 bash 7B_eval_dora.sh llava-v1.5-7b-dora-release ABSOLUTE_PATH/visual_instruction_tuning/checkpoints/llava-v1.5-7b-dora-release ABSOLUTE_PATH/LLaVA/playground/data/eval ABSOLUTE_PATH/visual_instruction_tuning/eval_result/llava-v1.5-7b-dora-release ABSOLUTE_PATH/visual_instruction_tuning