#! /bin/bash

#SBATCH -A MST111109
#SBATCH -J run_train
#SBATCH -p gp4d
#SBATCH -e slurm_txts/run_train.txt
#SBATCH -c 4
#SBATCH --gres=gpu:1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gohyixian456@gmail.com

# throw outputs into outputs/

# Trains using the base config with a batch size of 8 (the default).
python train.py --config=yolact_base_config

# # Trains yolact_base_config with a batch_size of 5. For the 550px models, 1 batch takes up around 1.5 gigs of VRAM, so specify accordingly.
# python train.py --config=yolact_base_config --batch_size=5

# # Resume training yolact_base with a specific weight file and start from the iteration specified in the weight file's name.
# python train.py --config=yolact_base_config --resume=weights/yolact_base_10_32100.pth --start_iter=-1

# # Use the help option to see a description of all available command line arguments
# python train.py --help