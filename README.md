# Hierarchical-Back-Projection-Network-for-image-SR
Blind image super-resolution using Hierarchical Back Projection Network (HBPN) to achieve good SR performance with low distortion.

For proposed HBPN model, we claim the following points:

• Blind image SR without knowing any information of the down-scaling factor and operations.

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

# Reimplementation
## 1. Testing
---------------------------------------
Run **HBPN_main.ipynb** on Jupyter Notebook. Modify the directories of files based on your working environment.

## 2. Training
---------------------------
### a. Download the training images from NTIRE2019 Real Super-Resolution Challenge
    
       https://competitions.codalab.org/competitions/21439#participate
   
### b. Generate training/testing files 
Find data generation code in `Matlab` and run **patch_collection.m** to generate training/testing HDF5 files and put them in `Data` folder.  
Find train.txt and test.txt in `code` folder and change the directories of generated HDF5 files.
### c. Start training on Caffe
   
```sh
$ caffe train -solver HBPN_solver.protxt -GPU=0,1 2>&1 | tee -a HBPN.log
```
      
---------------------------
  
# Experimental results

Visual Comparison

![visual compare](/figure/picture.png)
