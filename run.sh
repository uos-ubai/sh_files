#!/bin/bash
#SBATCH --job-name=MY_JOB                  # 사용자의 작업 이름으로 변경
#SBATCH --output=./output/%j.out
#SBATCH --error=./output/%j.err
#SBATCH --partition=gpu1                   # 사용할 파티션 이름으로 변경 필요 -> partition number(cpu1/gpu1/gpu2/gpu3/gpu4/gpu5/gpu6)
#SBATCH --nodelist=n001                    # 사용할 노드 이름으로 변경 -> node number(n001 ~ n106)                  
#SBATCH --gres=gpu:1                       # 사용할 gpu 수
#SBATCH --cpus-per-task=1                  # 하나의 태스크가 사용할 CPU 코어 수

echo "start at: $(date)"                   # 접속한 날짜 표기
echo "node: $HOSTNAME"                     # 접속한 노드 번호 표기
echo "jobid: $SLURM_JOB_ID"                # jobid 표기

# Load modules (cuda 환경)
module load cuda/11.8.0 

# Load env (python 환경)
source ~/miniconda3/etc/profile.d/conda.sh     

# 가상환경 활성화 (설치한 가상환경 이름으로 변경 필요, test -> 가상환경 이름)
conda activate test                        # test라는 conda 환경에서 슈퍼컴퓨팅 사용 준비
# python 스크립트 실행
python predict.py                          # predict라는 python 파일 실행
