Title : Getting and Cleaning Data-Codebook
========================================================

## The variables used is run_analysis.R script are as below - 

### *Conversion Variables*
as.c=as.character
as.n=as.numeric

### *Reading Test data files Variables*
test_subject = Variable of class dataframe having subject identifier values for test data    
test_set     = Variable of class dataframe having test set values  
test_label   = Variable of class dataframe having Activity Labels for test data  

### *Reading Training data files Variables*
train_subject =  Variable of class dataframe having subject identifier values for training data    
train_set     =  Variable of class dataframe having subject identifier values  
train_label   =  Variable of class dataframe having subject identifier values  

### *Merging test data files Variable*
test.data     =  Variable of class dataframe having merged test data  

### *Merging training data files Variable*
train.data    = Variable of class dataframe having merged training data  

### *Merge train and test data file Variable*
combined.data = Variable of class dataframe having merged test and trainng data  

### *561 feature vector Variable*
features      = Dataframe with features from features.txt  
features.vector= Character Vector with names of all features  

### *Columns with mean and std Variables*
cols          = Integer vector with columnn indices with mean/std observations  
combined.data1 = Data frame with appropriate column names(from cols)  
combined.data2 = Data frame with merged data with appropriate column names  

### *Retreiving activity names*
activity       = Data frame with activity names  
activity.vec   = Character Variable with activity names and index  
combined.data2$Activity.Labels = Data frame with merged data(combined.data2) with activity indices replaced by names     

### *Tidy Data set Variables*
split.data1    = List Variable with data split by Subjects  
out = code performing groupwise calculation for average features for each subject and activity  
tidy.data = Tidy Data set
 

