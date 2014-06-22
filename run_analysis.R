as.c=as.character
as.n=as.numeric
#setwd("~/Documents/Courses/JHU_Data Science/3_Cleaning data/project/GettingAndCleaningData.Project2/")
#------------read all test files
cat(as.c(Sys.time()), "BGN Reading data\n")
test_subject = read.table("data/test/subject_test.txt", sep="\t",col.names="Subject Indentifier")
#View(test_subject)
test_set = read.table("data/test/X_test.txt")
#View(test_set)
test_label = read.table("data/test/y_test.txt", sep="\t",col.names="Activity Labels")
#View(test_label)

#------------read all training files
train_subject = read.table("data/train/subject_train.txt",col.names="Subject Indentifier")
#View(train_subject)
train_set = read.table("data/train/X_train.txt")
#View(train_set)
train_label = read.table("data/train/y_train.txt", sep="\t",col.names="Activity Labels")
#View(train_label)

#------------merge test data files
cat(as.c(Sys.time()), "BGN Merging test and training data\n")
test.data <-cbind(test_subject,test_label,test_set)

#------------merge train data file
train.data <-cbind(train_subject,train_label,train_set)

#------------merge train and test data file
combined.data <-rbind(test.data,train.data)

#------------retreiving 561 feature vector
cat(as.c(Sys.time()), "Subsetting to selected columns, mean and std\n")
features <- read.table(file="data/features.txt")
features.vector <- as.vector(features[,2])

#-----------assign column names to 561 features in combined data file
colnames(combined.data)[3:563]= features.vector

#-----------select columns with mean and std
cols <- grep(pattern="mean\\(|std\\()",x=colnames(combined.data))
combined.data1 <- combined.data[,cols]
combined.data2 <- cbind(combined.data[,1:2],combined.data1[,])

#-----------retreiving activity names
activity <- read.table(file="data/activity_labels.txt")
activity.vec <- as.c(activity[,2]);names(activity.vec)=1:6
combined.data2$Activity.Labels = activity.vec[combined.data2$Activity.Labels]

#----------group data as per subject and activity and find mean
cat(as.c(Sys.time()), "Splitting, summarizing and creating tidy data\n")
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
#View(tidy.data)

#------export to text file
write.table(x=tidy.data,file="output/tidydata.txt",sep="\t")

#------reading tidy data 
View (read.table(file="output/tidydata.txt",sep="\t",header=TRUE,check.names=FALSE)    )
