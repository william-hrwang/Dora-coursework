## Environment
```bash
module purge
module load gcc arrow/17.0.0
module load python/3.10 cuda


cd /home/hwan783/scratch/homework/DoRA/commonsense_reasoning
# first time: virtualenv --no-download dora_com_venv
# first time: pip install --no-index --upgrade pip
source dora_com_venv/bin/activate
```

## Dataset
```bash
git clone https://github.com/AGI-Edgerunners/LLM-Adapters.git
mv LLM-Adapters/dataset ./dataset

wget https://raw.githubusercontent.com/AGI-Edgerunners/LLM-Adapters/main/ft-training_set/commonsense_170k.json -O commonsense_170k.json
```

## Example scripts to finetune the model
```bash
# run llama_7B_finetuning
sh ./scripts/llama_7B_Dora.sh 32 64 ./finetuned_result/dora_r32 0                 # time used: 06:39:17
# run llama_7B_evaluation
sh ./scripts/llama_7B_Dora_eval.sh ./finetuned_result/dora_r32 0                  # time used: 01:59:00

# run llama_7B_finetuning with qkv tuning
sh ./scripts/llama_7B_Dora_qkv.sh 32 64 ./finetuned_result/dora_qkv_r32 0         # time used: 06:35:45
# run llama_7B_evaluation with qkv tuning
sh ./scripts/llama_7B_Dora_eval.sh ./finetuned_result/dora_qkv_r32 0              # time used: 01:30:14
```