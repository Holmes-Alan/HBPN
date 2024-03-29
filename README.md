[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/hierarchical-back-projection-network-for/image-super-resolution-on-urban100-4x)](https://paperswithcode.com/sota/image-super-resolution-on-urban100-4x?p=hierarchical-back-projection-network-for)

[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/hierarchical-back-projection-network-for/image-super-resolution-on-bsd100-8x-upscaling)](https://paperswithcode.com/sota/image-super-resolution-on-bsd100-8x-upscaling?p=hierarchical-back-projection-network-for)

[![PWC](https://img.shields.io/endpoint.svg?url=https://paperswithcode.com/badge/hierarchical-back-projection-network-for/image-super-resolution-on-manga109-2x)](https://paperswithcode.com/sota/image-super-resolution-on-manga109-2x?p=hierarchical-back-projection-network-for)

# HBPN (Hierarchical-Back-Projection-Network-for-image-SR)

By Zhi-Song, Li-Wen Wang and Chu-Tak Li

This repo only provides simple testing codes, pretrained models and the network strategy demo.

We propose a single image super-resolution using Hierarchical Back Projection Network (HBPN) to achieve good SR performance with low distortion.You can check the paper from [arxiv](https://arxiv.org/abs/1906.06874)

# BibTex

        @InProceedings{Liu2019hbpn,
            author = {Liu, Zhi-Song and Wang, Li-Wen and Li, Chu-Tak and Siu, Wan-Chi},
            title = {Hierarchical Back Projection Network for Image Super-Resolution},
            booktitle = {The Conference on Computer Vision and Pattern Recognition Workshop(CVPRW)},
            month = {June},
            year = {2019}
        }

# For proposed HBPN model, we claim the following points:

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

Testing results on NITRE2019 RealSR can be downloaded from the following link:

https://drive.google.com/open?id=1ASK7U3XU8zi6W5wbW8osZwgJ9jE04r1C

## Partial image visual comparison

![visual compare](/figure/picture.png)

## Complete image visual comparison
# img_031.png in Urban100 dataset
![Urban100 visual compare](/figure/Urban_compare.png)

# 302008.png in BSD100 dataset
![BSD100 visual compare](/figure/BSD_compare.png)

## Quantitative Comparison
![quantitative compare](/figure/table.png)
