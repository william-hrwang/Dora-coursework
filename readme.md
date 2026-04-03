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
The notebook [`commonsense_reasoning/run_analysis.ipynb`](https://github.com/william-hrwang/Dora-coursework/blob/main/commonsense_reasoning/run.ipynb) contains code for data visualization and analysis of the results.

#### Results Summary
| base_model | rank | ARC-Challenge | ARC-Easy | boolq | hellaswag | openbookqa | piqa | social_i_qa | winogrande | average |
|------------|------|---------------|----------|--------|------------|-------------|------|--------------|-------------|----------|
| llama_7B   | 4    | 0.626280      | 0.786195 | 0.401223 | 0.251544   | 0.786       | 0.420022 | 0.778403     | 0.787687    | 0.604669 |
| llama_7B   | 8    | 0.656997      | 0.816077 | 0.698165 | 0.851723   | 0.798       | 0.818825 | 0.797339     | 0.801894    | 0.779877 |
| llama_7B   | 16   | 0.654437      | 0.806397 | 0.699388 | 0.831707   | 0.776       | 0.824810 | 0.795803     | 0.806630    | 0.774397 |
| llama_7B   | 32   | 0.453925      | 0.505892 | 0.681957 | 0.667297   | 0.578       | 0.809576 | 0.477482     | 0.439621    | 0.576719 |
| llama_7B   | 64   | 0.593003      | 0.744949 | 0.700306 | 0.784206   | 0.742       | 0.819369 | 0.693961     | 0.786898    | 0.733087 |
| llama2_7B  | 16   | 0.710751      | 0.843434 | 0.720183 | 0.890360   | 0.812       | 0.831338 | 0.799386     | 0.829519    | 0.804622 |
| llama2_7B  | 32   | 0.684300      | 0.836279 | 0.717431 | 0.890858   | 0.824       | 0.837867 | 0.759980     | 0.825572    | 0.797036 |
| llama3_8B  | 16   | 0.789249      | 0.901094 | 0.744954 | 0.954989   | 0.872       | 0.887378 | 0.803480     | 0.846882    | 0.850003 |
| llama3_8B  | 32   | 0.803754      | 0.905303 | 0.746177 | 0.955089   | 0.860       | 0.892818 | 0.799386     | 0.855564    | 0.852261 |

## 2) Image/Video-Text Understanding

- Slurm script: `image_video_text_understanding/image_slurm.sh`
- Official guide: `image_video_text_understanding/README_dora.md`
- Working directory in script: `/home/hwan783/scratch/project/DoRA/image_video_text_understanding`


## 3) Visual Instruction Tuning

- Slurm script: `visual_instruction_tuning/visual_slurm.sh`
- Official guide: `visual_instruction_tuning/README_dora.md`
- Working directory in script: `/home/hwan783/scratch/project/DoRA/visual_instruction_tuning`