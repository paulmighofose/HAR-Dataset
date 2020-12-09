# HAR-Dataset
The HAR Data set includes an r_analysis.r script and a HAR Mean.SD.txt file. The r_analysis.r file should be used in conjunction with the UCI HAR Dataset downloaded at the beginning of the project.  The HAR Mean.SD.txt file provides a data frame containing the mean and standard deviation of, both, test and train datasets with frequencies (i.e. variables) ranging from 1 to 561.  To utilize the run_anaylsis.r script: 
	1. Download the UCI HAR Dataset to your Desktop and label folder as HAR Data
	2. Open the run_analysis file utilizing the R DIE
	3. Within the R script you will notice a “SET WORKING DIRECTORY” input at lines 8, 13, 113, 117, 216, 223, 267, & 318. 
	4. Reset the input with your working directory address and:
	5. Run the run_analysis.r file 

As you run the run_analysis script you’ll notice:
	1.  Each data set is read into the IDE
	2. An explanation of  each data manipulation
	3. Data manipulated, transformed, and printed to depict transformations
	4.  The setting and resetting of the working directory
	5.  And a write.table function following “###” that is (once removed) utilized to write the new data tables: HAR_Complete_Dataset and HAR Mean.SD.txt files.
Note:
	Each data set is tidy and provides descriptive names of each observation.  
