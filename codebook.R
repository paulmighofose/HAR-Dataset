

 
### Variables to read datasets into R: 
activity_labels 
subject_test 
y_test 
x_test 
 
### Variables renamed:  
participants 
test_type
label 

### Data frame consisting of numbers 1 through 2947:
Id 

### Id data frame with each data set( i.e. participant, Test_Type, & x_test datasets):
participant_Id <- Id & participant
Test_Type_Id <- Id & Test_Type
x_test_Id <- Id & x_test


### Merging participant_Id & Test_Type_Id dataset: 
Participant_Test_Type 

### Renamed column in label dataset to "Activity" 
Label <- rename(label, Activity = "V1")
Participant_Test_Type_Activity_Label <- merge(Participant_Test_Type, Label, by = "Activity")


### Merging x_test & Particpant_Test_Type_Activity_Label dataset
TestData <- merge(Participant_Test_Type_Activity_Label, x_test_Id, by = "Id") 

### Rearranged Vector observations 
TestDataSet <- TestData %>% gather(Vector, Frequency, V1:V561)
combine1 <- TestDataSet &observation_Type1

### Data frame written to file in working directory as a preliminary to final test data file 
### write.table(TestData, "Preliminary Test Data.txt")
### Data frame that provides descrptive variable names 
Test.Data 
 
### Activity_label & test datasets into IDE with read.table():
activity_labels <- "activity_labels.txt"

subject_train <- "subject_train.txt"
y_train <- "y_train.txt"
x_train <- "X_train.txt"

### Renamed datasets with more descriptive labels:
train_participants <- subject_train
train_type <- y_train
label <- activity_labels

### A data frame consisting of numbers 1 through 7352:
Id 

### The Id data frame with each data set( i.e. participant, Train_Type, & x_train datasets):
participant_Id <- Id & Train_participant
Train_Type_Id <- Id & Train_Type
x_train_Id <- Id & x_train

### The merged participant_Id & Train_Type_Id dataset: 
Participant_Train_Type 

### Renaming column in label dataset to "Activity" 
Label 
Participant_Train_Type_Activity_Label 

### Merging x_train & Particpant_Train_Type_Activity_Label datasets to create a larger train dataset:
<- merge(Participant_Train_Type_Activity_Label, x_train_Id, by = "Id") 

###The Test and Train Datasets into one dataset 
HAR_Complete_Dataset 

### A table with the mean and standard deviation of the vectors:
x_test_Train 

### An Id column from 1:561 : 
Train.Id <- data.frame(Id = 1:561)

### The Mean of each vector and storing as a data frame:
Train.Avg 

### The Standard Deviation of each vector and storing as a data.frame:
Train.St.d 

### The Id data frame with the Avg & St.d datasets:
Train.Mean <- Train.Id & Train.Avg combined
Train.SD   <- Train.Id, Train.St.d combined

### The mean and standard deviation of the vectors:
x_test_Test 

### An Id column form 1:561
Test.Id 

### The Mean of each vector and store as a data frame
Test.Avg 

### The Standard Deviation of each vector and store as a data.frame
Test.St.d 

### Combine the Id data frame with the Avg & St.d datasets
Test.Mean <- Test.Id & Test.Mean combined
Test.SD   <- Test.Id & Test.St.d combined

### The Train and Test mean and Standard deviation datasets:
Mean.SD 

### The average of each variable for each activity and each subject.
independent 




