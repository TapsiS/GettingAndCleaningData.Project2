as.c=as.character
as.n=as.numeric
setwd("~/Documents/Courses/JHU_Data Science/3_Cleaning data/project/UCI HAR Dataset")
#------------read all test files
test_subject = read.table("test/subject_test.txt", sep="\t",col.names="Subject Indentifier")
#View(test_subject)
test_set = read.table("test/X_test.txt")
#View(test_set)
test_label = read.table("test/y_test.txt", sep="\t",col.names="Activity Labels")
#View(test_label)

#------------read all training files
train_subject = read.table("train/subject_train.txt",col.names="Subject Indentifier")
#View(train_subject)
train_set = read.table("train/X_train.txt")
#View(train_set)
train_label = read.table("train/y_train.txt", sep="\t",col.names="Activity Labels")
#View(train_label)

#------------merge test data files
test.data <-cbind(test_subject,test_label,test_set)

#------------merge train data file
train.data <-cbind(train_subject,train_label,train_set)

#------------merge train and test data file
combined.data <-rbind(test.data,train.data)

#------------retreiving 561 feature vector
features <- read.table(file="features.txt")
features.vector <- as.vector(features[,2])

#-----------assign column names to 561 features in combined data file
colnames(combined.data)[3:563]= features.vector

#-----------select columns with mean and std
cols <- grep(pattern="mean\\(|std\\()",x=colnames(combined.data))
combined.data1 <- combined.data[,cols]
combined.data2 <- cbind(combined.data[,1:2],combined.data1[,])

#-----------retreiving activity names
activity <- read.table(file="activity_labels.txt")
activity.vec <- as.c(activity[,2]);names(activity.vec)=1:6
combined.data2$Activity.Labels = activity.vec[combined.data2$Activity.Labels]

#----------group data as per subject and activity and find mean
split.data1 <- split(combined.data2,combined.data2$Subject.Indentifier)


out <- lapply(1:30, function(i){
    cat("\n",i)
    dat <- sapply(3:68, function(j){
        #cat("\t", j)
        tapply(split.data1[[i]][,j], split.data1[[i]]$Activity.Labels, mean)
    })
    colnames(dat) <- colnames(combined.data2)[3:68]
    dat <- data.frame(subject=i, activity=rownames(dat), dat)
})

tidy.data <- do.call(rbind, out)
View(tody_data)
    