Title : Getting and Cleaning Data-Codebook
========================================================

# Reading the data
## Test data variables:
test_subject = Variable of class dataframe having subject identifier values for test data    
test_set     = Variable of class dataframe having test set values  
test_label   = Variable of class dataframe having Activity Labels for test data  

## Training data variables:
train_subject =  Variable of class dataframe having subject identifier values 
                    for training data    
train_set     =  Variable of class dataframe having subject identifier values  
train_label   =  Variable of class dataframe having subject identifier values  

# Merging the data
### Merging test data Variable
test.data     =  Variable of class dataframe having merged test data  

### Merging training data Variable
train.data    = Variable of class dataframe having merged training data  

### Merge train and test data file Variable
combined.data = Variable of class dataframe having merged test and trainng data  

# Using descriptive activity names
### 561 feature vector Variable
features      = Dataframe with features from features.txt  
features.vector= Character Vector with names of all features  

### Columns with mean and std Variables
cols          = Integer vector with columnn indices with mean/std observations  
combined.data1 = Data frame with appropriate column names(from cols)  
combined.data2 = Data frame with merged data with appropriate column names  

### Retreiving activity names
activity       = Data frame with activity names  
activity.vec   = Character Variable with activity names and index  
combined.data2$Activity.Labels = Data frame with merged data(combined.data2) with activity indices replaced by names     

# Create a tidy data 
split.data1    = List Variable with data split by Subjects  
out = code performing groupwise calculation for average features for each subject and activity  
tidy.data = Tidy Data set

## Data Set

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.
 

