from memory:

0) download 50data from

http://www.cmlab.csie.ntu.edu.tw/project/food/

paper title: Automatic Chinese Food Identification and Quantity Estimation
authors: Mei-Yun Chen Yung-Hsiang Yang Chia-Ju Ho Shih-Han Wang Shane-Ming Liu Che-Hua Yeh Ming Ouhyoung
National Taiwan University 

copy to folder 50data in the repo directory

1) first run iterate_50data.m

it will create images{} loaded from the 50data directory

2) then run sift.m to generate codewords for the sift bag of words

if it doesn't work, first run svm_train.m (it will break but at least it will init some variables which ssift.m might need.... coupling FTW)

3) run svm_train.m to train the neural net (yes, I named it svm_train, you have a problem with that???)


