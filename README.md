# Hierarchical-Back-Projection-Network-for-image-SR
We propose a single image super-resolution using Hierarchical Back Projection Network (HBPN) to achieve good SR performance with low distortion.

For proposed HBPN model, we claim the following points:

• Enhanced back projection blocks.

• Adopt the HourGlass structure in back projection to gradually explore deeper and denser feature representation.

• Softmax based Weighted Reconstruction (WR) block to hierarchically minimize residues between SR and HR images.

# Dependencies
    Python 2.XXX<3.0
    OpenCV liberary
    Caffe 
    NVIDIA GPU + CUDA
    Jupyter Notebook
    MATLAB 6.0 and above

# Complete Architecture
The complete architecture is shown as follows,

![structure](/figure/structure.png)

# Implementation
## 1. Testing
---------------------------------------
### s1. Download trained HBPN model from the following link:
for NTIRE2019 testing dataset, download the model from the following link:

https://drive.google.com/open?id=1AeUiztLk0mrY8VwRtr4BVfnshNIM20xa

for 2x, 4x and 8x general testing dataset, download the model from the following link:

https://drive.google.com/open?id=1vcY7C-O87s9fWPlxNeEkHFCBoS8Z634T

### s2. Run **HBPN_main.ipynb** on Jupyter Notebook. Modify the directories of files based on your working environment.

Testing images on NTIRE2019 Real Super-Resolution Challenge can be downloaded from the following link:

https://drive.google.com/open?id=1OnVRlOM6mS6Zk2QvXpa9wJ0lfV3CH3-4

General testing dataset (Set5, Set14, BSD100, Urban100 and Manga109) can be downloaded from:

https://github.com/LimBee/NTIRE2017

## 2. Training
---------------------------
### s1. Download the training images from DIV2K and Flickr.
    
       https://data.vision.ee.ethz.ch/cvl/DIV2K/
       https://github.com/LimBee/NTIRE2017
   
### s2. Generate training/testing files 
Find data generation code in `Matlab` and run **patch_collection.m** to generate training/testing HDF5 files and put them in `Data` folder.  
Find `train.txt` and `test.txt` in `code` folder and change the directories of generated HDF5 files.
### s3. Start training on Caffe
For user who already has installed Caffe, simply just run the following code:
```sh
$ caffe train -solver HBPN_solver.protxt -GPU=0,1 2>&1 | tee -a HBPN.log
```

You can also use docker to install Caffe to run the code:
```sh
$ docker pull bvlc/caffe:gpu
```
```
$ nvidia-docker run -it --name [container_name] -p 8888:8888 -v ~/Data:/Data [image_name]
```
For testing, to call Jupyter for running:
```
$ jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root &
```
---------------------------
  
# Experimental results
All the testing results on Set5, Set14, BSD100, Urban100 and Manga109 can be downloaded from the following link:

https://drive.google.com/open?id=1esG6op8BePCEYsL43Fx8uXo4kmZGElbX

## Visual Comparison

![visual compare](/figure/picture.png)

## Quantitative Comparison
![quantitative compare](/figure/table.png)
