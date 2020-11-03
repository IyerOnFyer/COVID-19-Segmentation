# COVID-19-Segmentation

> **Authors:** 
> Tharun J Iyer
> Dr. Alex Noel Joseph Raj 
> Sushil Ghildiyal
> Dr. Ruban N

## Introduction
- This repository provides code for the research "_**Performance Analysis of Lightweight CNN Models to Segment Infectious Lung Tissue of COVID-19 cases from Tomographic Images**_"
- The dataset can be downloaded from here. It is openly available:
- 20 Patients - https://zenodo.org/record/3757476#.X5mMi4gzbIW (10.5281/zenodo.3757476)
- 50 Patients - https://mosmed.ai/datasets/covid19_1110 (Morozov, S.P., Andreychenko, A.E., Pavlov, N.A., Vladzymyrskyy, A.V., Ledikhova, N.V., Gombolevskiy, V.A., Blokhin, I.A.,
Gelezhe, P.B., Gonchar, A.V. and Chernina, V.Y., 2020. MosMedData: Chest CT Scans With COVID-19 Related Findings
Dataset. arXiv preprint arXiv:2005.06465.)

## Steps to run the code
- First download the images from the above mentioned websites. They are open-source so the images are freely available
- Run preprocess.m in the preprocess folder of the repository to preprocess the images. This is a MATLAB file. 
- The platform to train the models and run the predictions used was Google Colab. Hence, images are uploaded to a drive and the notebooks are mounted from the drive. 
- Run each IPYNB under the train folder to train the models and predict the masks.  
