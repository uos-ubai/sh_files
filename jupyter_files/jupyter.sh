#!/bin/bash
#SBATCH --job-name=MY_JOB                  # 사용자의 작업 이름으로 변경
#SBATCH --partition=gpu6                   # 사용할 파티션 이름으로 변경 필요 -> partition number(gpu1 ~ gpu6)
#SBATCH --gres=gpu:1                       # 사용할 gpu 수
#SBATCH --cpus-per-task=1                  # 하나의 태스크가 사용할 CPU 코어 수
#SBATCH -o ./output/jupyter%j.out          # STDOUT        
#SBATCH -e ./output/jupyter%j.err          # STDERR        

echo "start at:" `date`                    # 접속한 날짜 표기
echo "node: $HOSTNAME"                     # 접속한 노드 번호 표기
echo "jobid: $SLURM_JOB_ID"                # jobid 표기

module load cuda/11.8.0 

python -m jupyter lab $HOME \
        --ip=0.0.0.0 \
        --no-browser
