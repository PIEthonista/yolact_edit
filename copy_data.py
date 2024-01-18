import os
import shutil
from tqdm import tqdm

def copy_denoised_images(source_dir, target_dir):
    # Make sure the source and target directories exist
    if not os.path.exists(source_dir) or not os.path.exists(target_dir):
        print("Source or target directory does not exist.")
        return

    # Get a list of files in the source directory
    files = sorted(os.listdir(source_dir))

    # Iterate through the files and copy the ones that meet the criteria
    for file in tqdm(files):
        if file.endswith(".jpg") and "denoised" in file:
            source_path = os.path.join(source_dir, file)
            target_path = os.path.join(target_dir, file)

            # Copy the file
            shutil.copy2(source_path, target_path)
            print(f"Copied: {file}")

    print("Copying denoised images completed.")

# Example usage
source_directory = "/work/u5832291/view_neti_RT/results/mode3_Josef_test23-19"
target_directory = "/work/u5832291/yixian/YOLACT_edit/data/view_neti_RT/mode3_Josef_test23-19"

if not os.path.exists(target_directory):
    os.makedirs(target_directory)

copy_denoised_images(source_directory, target_directory)
