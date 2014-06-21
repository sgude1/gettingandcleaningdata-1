#READING AND BINDING all data related with TRAIN
subjectTrain = read.table("./UCI HAR Dataset/train/subject_train.txt")
activityTrain = read.table("./UCI HAR Dataset/train/y_train.txt")
measurementsTrain = read.table("./UCI HAR Dataset/train/X_train.txt")
train=cbind(subjectTrain,activityTrain,measurementsTrain)
rm(subjectTrain,activityTrain,measurementsTrain)

#READING and BINDING all data related with TEST
subjectTest = read.table("./UCI HAR Dataset/test/subject_test.txt")
activityTest = read.table("./UCI HAR Dataset/test/y_test.txt")
measurementsTest = read.table("./UCI HAR Dataset/test/X_test.txt")
test=cbind(subjectTest,activityTest,measurementsTest)
rm(subjectTest,activityTest,measurementsTest)

#BINDING Train and TEST in one dataset
ucihar = rbind(test,train) #OBJECTIVE 1
rm(test,train)

#NAMING the columns of the dataset #OBJECTIVE 4
listFeatures = read.table("./UCI HAR Dataset/features.txt")
features = as.vector(listFeatures$V2) #names for the measurements are imported
names(ucihar) = append(c("id","activity"),features) # the format is id, followed by activity and then the measurements
rm(listFeatures,features)

#ORDERING the dataset first by ID and then by ACTIVITY
ucihar = ucihar[order(ucihar$id,ucihar$activity),]
row.names(ucihar)<-NULL #Resetting row names after ordering

#FILTERING the dataset and leaving only the MEAN and STD measurements
ucihar = ucihar[grep("id|activity|mean[(]|std",names(ucihar))] #OBJECTIVE 2

#CREATING A SECOND independent DATASET with the AVERAGE for the measurements for each subjet and activity #OBJECTIVE 5
alter = data.frame() #creates an empty dataframe dataframe
for(i in 1:30){ #for each subject ID
    for(j in 1:6){ #for each activity ID        
        sutemp = subset(ucihar, ucihar$id==i & ucihar$activity==j) #subset with the measures for each SUBJECT and ACTIVITY
        metemp = colMeans(sutemp,3:ncol(ucihar))
        alter = rbind(alter,metemp) #stores the means column by column in the dataframe
    }
}
rm(i,j,sutemp,metemp)
names(alter) <- names(ucihar) #NAMES the columns of the new dataframe after the columns' names of the first

#GIVING DESCRIPTIVE ACTIVITY NAMES to the activities in the data set # OBJECTIVE 3
activityCodes = read.table("./UCI HAR Dataset/activity_labels.txt") #conversion table between activities and their assigned numeric codes
for(i in 1:nrow(ucihar)){ucihar$activity[i]=as.character(activityCodes$V2[as.numeric(ucihar$activity[i])])} #changing numeric codes for their written equivalent
for(i in 1:nrow(alter)){alter$activity[i]=as.character(activityCodes$V2[as.numeric(alter$activity[i])])} #changing numeric codes for their written equivalent
rm(activityCodes,i)

#EXPORTS THE DATAFRAMES created as TXT files
dir.create(path="./RESULTS")
write.table(ucihar,file="./RESULTS/moreData.txt", sep="\t")
write.table(alter,file="./RESULTS/tidyDataSet.txt", sep="\t")


