
### Loading Data packages to manipulate data:

library(dplyr)
library(tidyr)

 ### Designating working directory:
 setwd("/Users/paulighofose/Desktop/HAR Data")
 
### importing activity_label & test datasets into IDE with read.table():

activity_labels <- read.table("activity_labels.txt")
setwd("/Users/paulighofose/Desktop/HAR Data/test")
subject_test <- read.table("subject_test.txt")
y_test <- read.table("y_test.txt")
x_test <- read.table("X_test.txt")

### Determining dimensions of each dataset:
 dim(activity_labels)
 dim(subject_test)
 dim(y_test)
 dim(x_test)
 
### Renaming of datasets to more descriptive labels:
participants <- subject_test
test_type <- y_test
label <- activity_labels

### Printing variables to verify data transformation:

head(participants,5)
head(test_type,5)
head(label)

### Renaming columns for easy recognition between datasets for future merging:
participant <- rename(participants, Participant = "V1")
Test_Type <- rename(test_type, Activity = "V1")
Activity <- rename(label, Activity = "V1")

### Printing variables to verify data transformation:
head(participant,5)
head(Test_Type,5)
head(Activity)

###  Assuming each data set (i.e. subjects, tests, and activity labels) correspond to test data as shown in data frame, an Id was assigned to each data frame to maintain accurate records of each participant and his/her data during merging of data sets.
 
### Creating a data frame consisting of numbers 1 through 2947:
Id <- data.frame(Id = 1:2947)

### Printing variables to verify data transformation:
head(Id,5)

### Combining Id data frame with each data set( i.e. participant, Test_Type, & x_test datasets):
participant_Id <- cbind(Id, participant)
Test_Type_Id <- cbind(Id, Test_Type)
x_test_Id <- cbind(Id, x_test)

### Printing variables to verify data transformation:
head(participant_Id,5)
head(Test_Type_Id)

### Merging participant_Id & Test_Type_Id dataset: 
Participant_Test_Type <- merge(participant_Id, Test_Type_Id, by = "Id")

### Printing variables to verify data transformation:
head(Participant_Test_Type,5)

### Renamed column in label dataset to "Activity" to create consisitency across Participant_Test_Type data set. This action allows me to merge the two datasets into one larger data frame with identical Activity values.

Label <- rename(label, Activity = "V1")
Participant_Test_Type_Activity_Label <- merge(Participant_Test_Type, Label, by = "Activity")

### Printing variables to verify data transformation:
head(Participant_Test_Type_Activity_Label)

### Merging x_test & Particpant_Test_Type_Activity_Label datasets to create a larger test dataset:
TestData <- merge(Participant_Test_Type_Activity_Label, x_test_Id, by = "Id") 

### Used the gather function to rearrange Vector observations from multile columns to a single column with a corresponding frequency:
TestDataSet <- TestData %>% gather(Vector, Frequency, V1:V561)

### Printing variables to verify data transformation:
head(TestDataSet,5)

### Before the final file is creaeted, I need to distinguish Test data observations from Train data observations.
### Creating a data frame to identify observation Type:

n <- count(TestData)
observation_Type1 <-data.frame(Observation.Type = rep("Test", n)) 
combine1 <- cbind(TestDataSet,observation_Type1)

### Printing variables to verify data transformation:
head(combine1, 5)

### Data frame written to file in working directory as a preliminary to final test data file 
### write.table(TestData, "Preliminary Test Data.txt")
### To provide descrptive variable names the TestData data frame's Activity and V2.x column names were renamed and passed to a new data frame name:

Test.Data <- combine1 %>% rename(Activity.Code = "Activity") %>%  rename(Activity = "V2.x") %>% select(Id, Participant,Observation.Type, Activity.Code, Activity:Frequency) 

### Printing variables to verify data transformation:
head(Test.Data, 5)

### Data frame written to file in working directory as a preliminary to final test data file 
### write.table(TestData, "Preliminary Test Data.txt")

### Complete Test Dataset written as .txt file within working directory
### write.table(Test.Data, "Test Data Complete.txt")

### Repeat Steps to create a wide data set for the train data frames.

### Designating a working directory
setwd("/Users/paulighofose/Desktop/HAR Data")
 
### Importing activity_label & test datasets into IDE with read.table():
activity_labels <- read.table("activity_labels.txt")
setwd("/Users/paulighofose/Desktop/HAR Data/train")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
x_train <- read.table("X_train.txt")

### Determining the dimensions of each dataset:
 dim(activity_labels)
 dim(subject_train)
 dim(y_train)
 dim(x_train)
 
### Renaming of datasets to more descriptive labels:
train_participants <- subject_train
train_type <- y_train
label <- activity_labels

### Printing variables to verify data transformation:
head(train_participants,5)
head(train_type, 5)
head(label)

### Renaming columns for easy recognition between datasets for future merging:
Train_participant <- rename(train_participants, Participant = "V1")
Train_Type <- rename(train_type, Activity = "V1")
Activity <- rename(label, Activity = "V1")

### Printing variables to verify data transformation:
head(Train_participant, 5)
head(Train_Type, 5)
head(Activity)

###  Assuming each data set (i.e. subjects, tests, and activity labels) correspond to test data as shown in data frame, an Id was assigned to each data frame to maintain accurate records of each participant and his/her data during merging of data sets. 
### Creating a data frame consisting of numbers 1 through 7352:
Id <- data.frame(Id = 1:7352)

### Printing variables to verify data transformation:
head(Id, 5)

### Combining Id data frame with each data set( i.e. participant, Train_Type, & x_train datasets):
participant_Id <- cbind(Id, Train_participant)
Train_Type_Id <- cbind(Id, Train_Type)
x_train_Id <- cbind(Id, x_train)

### Printing variables to verify data transformation:
head(participant_Id, 5)
head(Train_Type_Id, 5)


### Merging participant_Id & Train_Type_Id dataset: 
Participant_Train_Type <- merge(participant_Id, Train_Type_Id, by = "Id")

### Printing variables to verify data transformation:
head(Participant_Train_Type,5)

### Renaming column in label dataset to "Activity" to create consisitency across Participant_Train_Type data set. This action allowe me to merge the two dataset into one larger data frame with identical Activity values:

Label <- rename(label, Activity = "V1")
Participant_Train_Type_Activity_Label <- merge(Participant_Train_Type, Label, by = "Activity")

### Printing variables to verify data transformation:
head(Participant_Train_Type_Activity_Label)

### Merging x_train & Particpant_Train_Type_Activity_Label datasets to create a larger train dataset:
TrainData <- merge(Participant_Train_Type_Activity_Label, x_train_Id, by = "Id") 

### Used the gather function to rearrange Vector observations from multile columns to a single column with a corresponding frequency:
TrainDataSet <- TrainData %>% gather(Vector, Frequency, V1:V561)

### Printing variables to verify data transformation:
head(TrainDataSet,5)

### Before the final file is creaeted, I need to distinguish Test data observations frpm Train data observations.
### Creating a data frame to identify observation Type:
n <- count(TrainData)
observation_Type2 <-data.frame(Observation.Type = rep("Train", n)) 
combine2 <- cbind(TrainDataSet,observation_Type2)

### Printing variables to verify data transformation:
head(combine2, 5)

### Data frame written to file in working directory as a preliminary to final train data file 
### write.table(TrainData, "Preliminary Train Data.txt")
### To provide descrptive variable names the TestData data frame's Activity and V2.x column names were renamed and passed to a new data frame name:

Train.Data <- combine2 %>% rename(Activity.Code = "Activity") %>%  rename(Activity = "V2.x") %>% select(Id, Participant,Observation.Type, Activity.Code, Activity:Frequency) 

### Printing variables to verify data transformation:
head(Train.Data, 5)

### Complete Train Dataset written as .txt file within working directory
### write.table(Train.Data, "Train Data Complete.txt")

###Combining the Test and Train Datasets into one dataset called HAR_Complete_Dataset and writting to directory:
HAR_Complete_Dataset <- rbind(Test.Data, Train.Data)

### Printing variable to verify data transformation:
head(HAR_Complete_Dataset, 5)

### Resetting working directory to save HAR_Complete dataset to primary directory: 
setwd("/Users/paulighofose/Desktop/HAR Data")
### Writting HAR_Complete_Dataset.txt to file:
### write.table(HAR_Complete_Dataset, "HAR Complete Dataset.txt")


### Creating a table with the mean and standard deviation of the vectors:

setwd("/Users/paulighofose/Desktop/HAR Data/train")
x_test_Train <- read.table("X_train.txt")

### Creating an Id column: 
Train.Id <- data.frame(Id = 1:561)

### Printing variables to verify data transformation:
head(Train.Id, 5)

### Finding the Mean of each vector and storing as a data frame:
Train.Avg <- data.frame( Mean = apply(x_test_Train, 2, mean))

### Printing variables to verify data transformation:
head(Train.Avg, 5)

### Finding the Standard Deviation of each vector and storing as a data.frame:
Train.St.d <- data.frame(Standard.Deviation = apply(x_test_Train, 2, sd))

### Printing variables to verify data transformation:
head(Train.St.d, 5)

### Combining the Id data frame with the Avg & St.d datasets:
Train.Mean <- cbind(Train.Id, Train.Avg)
Train.SD  <- cbind(Train.Id, Train.St.d)

### Printing variables to verify data transformation:
head(Train.Mean, 5)
head(Train.SD, 5)

### Combining the Mean & SD dataset with the merge function to create a dataset conveying the mean and Sandard deviation of  each vector observation:
Train.Sum <- merge(Train.Mean, Train.SD) 

### Printing variables to verify data transformation:
head(Train.Sum, 5)

### Renaming the Id column “Vector” to indicate which vector the mean and standard deviation belongs to: 
Train.summary <- Train.Sum %>% rename( Vector = "Id") %>% rename(Train.Mean = "Mean") %>% rename(Train.Standard.Deviation = "Standard.Deviation")
### Printing first 10 rows of dataset for verification 
head(Train.summary,10)

### Repeat steps to find the mean and standard deviation for the Test dataset:

### Creating a table with the mean and standard deviation of the vectors:

setwd("/Users/paulighofose/Desktop/HAR Data/test")
x_test_Test <- read.table("X_test.txt")

### Created an Id column 
Test.Id <- data.frame(Id = 1:561)

### Printing variables to verify data transformation:
head(Test.Id, 5)

### Find the Mean of each vector and store as a data frame
Test.Avg <- data.frame( Mean = apply(x_test_Test, 2, mean))

### Printing variables to verify data transformation:
head(Test.Avg, 5)

### find the Standard Deviation of each vector and store as a data.frame
Test.St.d <- data.frame(Standard.Deviation = apply(x_test_Test, 2, sd))

### Printing variables to verify data transformation:
head(Test.St.d, 5)

### Combine the Id data frame with the Avg & St.d datasets
Test.Mean <- cbind(Test.Id, Test.Avg)

### Printing variables to verify data transformation:
head(Test.Mean, 5)

Test.SD  <- cbind(Test.Id, Test.St.d)

### Printing variables to verify data transformation:
head(Test.SD, 5)

### Combine the Mean & SD dataset with the merge function to create a dataset conveying the mean and Sandard deviation of  each vector observation:
Test.Sum <- merge(Test.Mean, Test.SD) 
### Rename the Id column “Vector” to indicate which vector the mean and standard deviation belongs to. 

### Printing variables to verify data transformation:
head(Test.Sum, 5)

Test.summary <- Test.Sum %>% rename( Vector = "Id") %>% rename(Test.Mean = "Mean") %>% rename(Test.Standard.Deviation = "Standard.Deviation")

### Print first 10 rows of dataset for verification 
head(Test.summary,10)

###Combine, both, the Train and Test mean and Standard deviation datasets:
Mean.SD <- merge(Test.summary, Train.summary, by = "Vector")

###print dataset for verification 
head(Mean.SD, 10) 

### write dataset containing the mean & standard deviation to.txt file within directory"
### setwd("/Users/paulighofose/Desktop/HAR Data")
### write.table(Mean.SD, "HAR Mean.SD.txt")

### Creating an independent tidy dataset with the average of each variable for each activity and each subject.
independent <- HAR_Complete_Dataset %>% select(Activity:Frequency)

### Printing variables to verify data transformation:
head(independent, 5)


