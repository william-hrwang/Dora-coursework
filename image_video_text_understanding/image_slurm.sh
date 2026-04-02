#!/bin/bash
#SBATCH --job-name=dora_llama7b_finetuning                              # task name
#SBATCH --time=2-12:00:00                                               # maximum time (D-HH:MM:SS)
#SBATCH --mem=50G                                                       # memory requirement
#SBATCH --cpus-per-task=10                                              # number of CPU cores
#SBATCH --gpus-per-node=h100:2                                          # GPU requirement
#SBATCH --output=logs/dora_llama7b_finetuning/%A.out                    # standard output file (%A=jobID, %a=arrayID)
#SBATCH --error=logs/dora_llama7b_finetuning/%A.err                     # error output file
#SBATCH --mail-type=ALL                                                 # send email at begin and end of job
#SBATCH --mail-user=hwan783@uwo.ca                                      # email address
#SBATCH --account=def-urehman6


module purge
module load gcc arrow/17.0.0
module load python/3.10 cuda 

cd /home/hwan783/scratch/project/DoRA/image_video_text_understanding
source dora_com_venv/bin/activate

python download_backbones.py

# download dataset following the instructions in the official readme file

# Image-text multitask finetuning
bash ./VL-T5/scripts/image/dora.sh 1
# Video-text multitask finetuning
bash ./VL-T5/scripts/video/dora.sh 1
