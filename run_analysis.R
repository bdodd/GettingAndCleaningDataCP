###import the "features"
features<-read.table("features.txt", col.names=c("Number", "Feature"))

###import the "test" data
testSubjTest<-read.table("test/subject_test.txt", col.names=c("SubjectID"))
testX_test<-read.table("test/X_test.txt")
testY_test<-read.table("test/y_test.txt", col.names=c("Activity"))

#change the column names to more meaningful labels.
colnames(testX_test)<-features$Feature

#remove columns that don't deal with "mean" or "sd"
#create two temporay df for "mean" measurements and "sd" measurements and recombine
testX_testMean<-testX_test[,grepl("mean", colnames(testX_test), ignore.case=TRUE)]
testX_testSD<-testX_test[,grepl("std", colnames(testX_test), ignore.case=TRUE)]
testX_test<-cbind(testX_testMean, testX_testSD)


###import the "train" data
trainSubjTrain<-read.table("train/subject_train.txt", col.names=c("SubjectID"))
trainX_train<-read.table("train/X_train.txt")
trainY_train<-read.table("train/y_train.txt", col.names=c("Activity"))

#change the column names to more meaningful labels
colnames(trainX_train)<-features$Feature

#remove columns that don't deal with "mean" or "sd"
#create two temporay df for "mean" measurements and "sd" measurements and recombine
trainX_trainMean<-trainX_train[,grepl("mean", colnames(trainX_train), ignore.case=TRUE)]
trainX_trainSD<-trainX_train[,grepl("std", colnames(trainX_train), ignore.case=TRUE)]
trainX_train<-cbind(trainX_trainMean, trainX_trainSD)


###combine the different data frames into one called "data"
#first combine the "test" data into a single data frame
dataTest<-cbind(testSubjTest, testY_test, testX_test)

#second combine the "train" data into a single data frame
dataTrain<-cbind(trainSubjTrain, trainY_train, trainX_train)

#third combine the "test" and "train" df into a final data set
data<-rbind(dataTest, dataTrain)


#convert "Activity" values into factors and label accordingly to make it more informative
data$Activity<-as.factor(data$Activity)
levels(data$Activity)<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")


###Perform step 5 of the project
library(dplyr)
grouped<-group_by(data, Activity, SubjectID)
grouped<-summarise_each(grouped, funs(mean))
write.table(grouped, file="CPpart5.txt", row.name=FALSE)


