#!/bin/bash
#SBATCH --job-name=JOB_NAME                             
#SBATCH --partition=gpu6           # 원하는 파티션 번호로 수정                          
##SBATCH --gres=gpu:1              # 할당받고자 하는 GPU 수로 수정(최대 4개)   
#SBATCH --cpus-per-task=1          # 할당받고자 하는 CPU 코어 수로 수정(최대 48코어)                     
#SBATCH -o ./output/jupyter%j.out  # STDOUT        
#SBATCH -e ./output/jupyter%j.err  # STDERR        

echo "start at:" `date`
echo "node: $HOSTNAME" 
echo "jobid: $SLURM_JOB_ID" 

module load cuda/11.8.0 

python -m jupyter lab $HOME \
        --ip=0.0.0.0 \
        --no-browser
