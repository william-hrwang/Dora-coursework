# ECE9660 Group 1: Running DoRA on Digital Alliance of Canada
Group Member: Haoran Wang, Langkun Long
This README documents how to run three DoRA tasks for coursework presentiation:

- commonsense_reasoning
- image_video_text_understanding
- visual_instruction_tuning

## Platform and Account

- HPC platform: Digital Alliance of Canada
- User: Haoran Wang (`hwan783`)
- Group Account in Slurm scripts: `def-atrisha`

## 1) Commonsense Reasoning
Due to time constraints, we focus primarily on this task. The main code and results are provided in the Jupyter notebook. However, we still provide Slurm scripts for the other two tasks for completeness.

- Slurm script directory: `commonsense_reasoning/scripts/slurm`
- Official guide: `commonsense_reasoning/README.md`
- data analysis: `run_analysis.ipynb`

#### Environment Setup：
```bash
module purge
module load gcc arrow/17.0.0
module load python/3.10 cuda

# first time: virtualenv --no-download dora_com_venv
# first time: pip install --no-index --upgrade pip
source dora_com_venv/bin/activate
```
The notebook `./commonsense_reasoning/run_analysis.ipynb` contains code for data visualization and analysis of the results.

#### Results Summary


## 2) Image/Video-Text Understanding

- Slurm script: `image_video_text_understanding/image_slurm.sh`
- Official guide: `image_video_text_understanding/README_dora.md`
- Working directory in script: `/home/hwan783/scratch/project/DoRA/image_video_text_understanding`


## 3) Visual Instruction Tuning

- Slurm script: `visual_instruction_tuning/visual_slurm.sh`
- Official guide: `visual_instruction_tuning/README_dora.md`
- Working directory in script: `/home/hwan783/scratch/project/DoRA/visual_instruction_tuning`