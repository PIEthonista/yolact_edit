#! /bin/bash

#SBATCH -A MST111109
#SBATCH -J run_test
#SBATCH -p gp4d
#SBATCH -e slurm_txts/run_test.txt
#SBATCH -c 4
#SBATCH --gres=gpu:1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=gohyixian456@gmail.com

# throw outputs into outputs/

# # Display qualitative results on the specified image.
# python eval.py --trained_model=weights/yolact_base_54_800000.pth --score_threshold=0.15 --top_k=15 --image=my_image.png

# # Process an image and save it to another file.
# python eval.py --trained_model=weights/yolact_base_54_800000.pth --score_threshold=0.15 --top_k=15 --image=input_image.png:output_image.png

# # Process a whole folder of images.
# python eval.py --trained_model=weights/yolact_base_54_800000.pth --score_threshold=0.15 --top_k=15 --images=path/to/input/folder:path/to/output/folder


# python eval.py --trained_model weights/yolact_base_54_800000.pth --score_threshold 0.15 --top_k 15 --images /work/u5832291/yixian/YOLACT_edit/data/view_neti_RT/mode3_Josef_test23-19:/work/u5832291/yixian/YOLACT_edit/outputs/view_neti_RT/mode3_Josef_test23-19___yolact_base_54_800000
# python eval.py --trained_model weights/yolact_darknet53_54_800000.pth --score_threshold 0.15 --top_k 15 --images /work/u5832291/yixian/YOLACT_edit/data/view_neti_RT/mode3_Josef_test23-19:/work/u5832291/yixian/YOLACT_edit/outputs/view_neti_RT/mode3_Josef_test23-19___yolact_darknet53_54_800000
# python eval.py --trained_model weights/yolact_im700_54_800000.pth --score_threshold 0.15 --top_k 15 --images /work/u5832291/yixian/YOLACT_edit/data/view_neti_RT/mode3_Josef_test23-19:/work/u5832291/yixian/YOLACT_edit/outputs/view_neti_RT/mode3_Josef_test23-19___yolact_im700_54_800000
python eval.py --trained_model weights/yolact_plus_base_54_800000.pth --score_threshold 0.15 --top_k 15 --images /work/u5832291/yixian/YOLACT_edit/data/view_neti_RT/mode3_Josef_test23-19:/work/u5832291/yixian/YOLACT_edit/outputs/view_neti_RT/mode3_Josef_test23-19___yolact_plus_base_54_800000
python eval.py --trained_model weights/yolact_plus_resnet50_54_800000.pth --score_threshold 0.15 --top_k 15 --images /work/u5832291/yixian/YOLACT_edit/data/view_neti_RT/mode3_Josef_test23-19:/work/u5832291/yixian/YOLACT_edit/outputs/view_neti_RT/mode3_Josef_test23-19___yolact_plus_resnet50_54_800000
# python eval.py --trained_model weights/yolact_resnet50_54_800000.pth --score_threshold 0.15 --top_k 15 --images /work/u5832291/yixian/YOLACT_edit/data/view_neti_RT/mode3_Josef_test23-19:/work/u5832291/yixian/YOLACT_edit/outputs/view_neti_RT/mode3_Josef_test23-19___yolact_resnet50_54_800000
