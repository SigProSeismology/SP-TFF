# Sparsity-Promoting Time-Frequency Filtering (SP-TFF)
Tutorials and updated codes for the research paper: Sparsity-promoting approach to polarization analysis of seismic signals in the time-frequency domain, published in IEEE transaction in Geoscience and Remote sensing journal, DOI:10.1109/TGRS.2022.3141580

## **The codes have been tested on MATLAB on both Linux and Windows OS.** I will constantly update this repo to make them easier to use and understand.

## Brief Introduction:
SP-TFF code package aims to present a methodology for high-resolution polarization analysis and filtering of seismic signals in the TF-domain. The main developments in this research work are: (a) reformulation of the eigenvalue decomposition polarization analysis (EDPA) in  TF-domain, (b) combining the SP-TFR to the formulation to obtain high-resolution TF-domains polarization parameters for discriminating nearby seismic phases, and (c)  incorporating TF-domain directivity, rectilinearity, and amplitude attributes to extract (or eliminate) different seismic phases. The main focus is to discriminate between Love and Rayleigh from the body and coda waves.

## Contents of this repo
1. The synthetic and real example of the "Sparsity-promoting approach to polarization analysis of seismic signals in the time-frequency domain" are reproducible.

2. A fast and efficient code for sparsity-promoting time-frequency representation (SP-TFR) is presented.

## Installation
Run the 
Then enter the directories of tutorials and execute corresponding notebooks and scripts.
## Citation
If you use the S-EqT codes in your research, please cite both:

Zhuowei Xiao, Jian Wang*, Chang Liu, Juan Li, Liang Zhao, and Zhenxing Yao. (2021). Siamese Earthquake Transformer: A pair-input deep-learning model for earthquake detection and phase picking on a seismic array. Journal of Geophysics Research: Solid Earth. https://doi.org/10.1029/2020JB021444

and

S. Mostafa Mousavi, William L Ellsworth, Weiqiang Zhu, Lindsay Y Chuang, and Gregory C Beroza. (2020). Earthquake transformer—an attentive deep-learning model for simultaneous earthquake detection and phase picking. Nature Communications 11, 3952. https://doi.org/10.1038/s41467-020-17591-w

If you use the pipeline in the tutorial, please cite the following papers as well:

REAL for linking seismic phases:

Miao Zhang, William L Ellsworth, and Gregory C Beroza. (2019). Rapid Earthquake Association and Location. Seismological Research Letters, 90(6), 2276–2284. https://doi.org/10.1785/0220190052

HypoInverse for locating earthquakes:

Fred W Klein. (2002). Userʼs Guide to HYPOINVERSE-2000, a Fortran Program to Solve for Earthquake Locations and Magnitudes 4/2002 version. USGS, Open File Report 02-171 Version, 1, 123.

## Advantages of this work
1. The S-EqT model can reduce the false-negative rate of the EqT model and perform well on earthquake detection and phase picking at the local scale (epicenter distance less than ~200 km).

2. The increase in seismic phases can improve the earthquake location estimations and benefit the tomography study.

3. The S-EqT model provides a novel approach for phase picking at the network level by cross-correlating seismograms of the same earthquake recorded at other stations in the latent domain. We may use this attribute for solving the phase association task in the future.

## Limitations of this work
1. Several questions remain regarding the attributes of feature maps extracted from the EqT model. For example, to what degree the path effect is discarded? How much information do the extracted features carry on event source? 

2. The parameters of the EqT model are fixed in this study. The performance of S-EqT may be improved by applying a loss that constraints latent feature maps to optimize the pre-trained EqT model.

3. Because the feature enhancing module is designed based on the observation of feature maps inside the pre-trained EqT model, it may not generalize well with other models. This module may be removed if the backbone model for feature extraction is trained from the stretch. 

4. The geometry of the template and searching stations, which may benefit the similarity measurement, is not considered in the S-EqT model.

5. The batch size in training and testing is set to be one for implementation convenience, which limits the training and testing speed.

## Bug report
If you occur any bugs or questions, you can either open a new issue in this repo or send me an e-mail (xiaozhuowei@mails.iggcas.ac.cn). 

## Acknowledgments
We would like to thank S. Mostafa Mousavi and his colleagues for developing the EqT model (https://github.com/smousavi05/EQTransformer), which is the base of our S-EqT model.

We would like to thank Miao Zhang for developing REAL (https://github.com/Dal-mzhang/REAL).

We would like to thank Fred Klein for developing HypoInverse (https://www.usgs.gov/software/hypoinverse-earthquake-location)

We would like to thank Yijian Zhou for developing the python interface for HypoInverse (https://github.com/YijianZhou/Hypo-Interface-Py)







































# SP-TFF
This code package aims to present a methodology for high-resolution polarization analysis and filtering of seismic signals in the TF-domain. The main developments in this research work are: (a) reformulation of the eigenvalue decomposition polarization analysis (EDPA) in  TF-domain, (b) combining the SP-TFR to the formulation to obtain high-resolution TF-domains polarization parameters for discriminating nearby seismic phases, and (c)  incorporating TF-domain directivity, rectilinearity, and amplitude attributes to extract (or eliminate) different seismic phases. The main focus is to discriminate between Love and Rayleigh from the body and coda waves.

The source codes represents the methodology presented in the Sparsity-promoting approach to polarization analysis
of seismic signals in the time-frequency domain paper published in the IEEE transacton in Geoscience and Remote sensing Journal.

Contributors
Hamzeh Mohammadigheymasi - Maintainer - Hamzeh Mohammadigheymasi

License
This project is licensed under the MIT License - check the LICENSE file for details.

The code computes the outputs of the synthetic simulation of "Sparsity-promoting approach to
polarization analysisof seismic signals in the time-frequency domain",
 IEEE TRANSACTIONS ON GEOSCIENCE AND REMOTE SENSING

 https://github.com/SigProSeismology/SP-TFF

Hamzeh Mohammadigheymasi, Sparsity-promoting approach to polarization analysis of seismic signals in the time-frequency domain, July 2020

NOTE: This SOFTWARE may be used by any individual or corporation for any purpose
with the exception of re-selling or re-distributing the SOFTWARE.
By using this software, you are agreeing to the terms detailed in this software's
Matlab source file.

BEGIN TERMS OF USE LICENSE

This SOFTWARE is maintained by the SP-TFF Project.
The copyright and ownership is jointly held by
the first author of the "Sparsity-promoting approach to polarization analysis of seismic signals in the time-frequency domain"
published in the IEEE transaction on Geoscience and remote sensing journal.
project may be contacted via email at:  hamzeh@ubi.pt

The term 'SOFTWARE' refers to the Matlab source code, translations to
any other computer language, or object code

Terms of use of this SOFTWARE

1) This SOFTWARE may be used by any individual or corporation for any purpose
   with the exception of re-selling or re-distributing the SOFTWARE.

2) The AUTHOR and SP-TFF must be acknowledged in any resulting publications or
   presentations

3) This SOFTWARE is provided "as is" with no warranty of any kind
   either expressed or implied. SP-TFF makes no warranties or representation
   as to its accuracy, completeness, or fitness for any purpose. SP-TFF
   is under no obligation to provide support of any kind for this SOFTWARE.

4) SP-TFF project periodically adds, changes, improves or updates this SOFTWARE without
   notice. New versions will be made available at ble at https://github.com/SigProSeismology/SP-TFF.

5) Use this SOFTWARE at your own risk.

END TERMS OF USE LICENSE


Written by Hamzeh Mohammadigheymasi, 2020
Last Modified: 11/Nov/2021
Version 1.0
Since 0.0.1
