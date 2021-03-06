###There are two steps involved in this analysis:

1.	**Constructing raw data**
	* Raw data spread across multiple files. 
	* This process consolidates data from multiple files into single data set.
	* Following diagram depicts how data from multiple files are consolidated into single data set:
	
	<img src="https://raw.githubusercontent.com/dhili/tidydata/master/rawdata.jpg" />
	* Read all features from features.txt file, filter by mean and standard deviation and set as column labels in raw data set. **NOTE:** Analysis considered only mean & standard deviation columns [exact match] and excluded rest.
	* Read train[X_train.txt] and test[X_test.txt] data, add to raw data set as data elements.
	* Read train [y_train.txt] and test [y_test.txt] activity data, set column label as "Activity Id", add to raw data set.
	* Read train [subject_train.txt] and test [subject_test.txt] subject data, set column label as "subject", add to raw data set.
	* Merge activity labels [activity_labels.txt] with raw data set, to get activity labels.

2.	**Transforming raw data into tidy data** 
	* Raw data of consists multiple variable data in a single variable, hence each variable in raw data is split into multiple variables. 
	* Here are the principles that are followed while transforming raw data into tidy data:
		* Each variable is a column
		* each observation is a row
	* Tidy data set consists of following variables:
		* Activity
		* Domain
		* Acceleration Type
		* Motion
		* Statistics
		* Axis
		* Subject
		* Mean value
	* Following diagram depicts how single column in raw data set mapped to multiple columns in tidy dataset:
	
	<img src="https://raw.githubusercontent.com/dhili/tidydata/master/Tidydata.jpg" />
	
	* Below grid depicts how columns from raw data split into multiple columns in tidy data set:
	
	<img src="https://raw.githubusercontent.com/dhili/tidydata/master/Rawdata%20to%20Tidydata.jpg" />
	
	* For more details around tidy data set please refer CodeBook.md file.