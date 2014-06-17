<h1>Data dictionary - Human Activity Recognition Using Smart phones </h1>

1.	Activity –various activities performed by each person.  
	* <b> Data Type </b> – Character
	* <b> Values:</b>
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING

2.	Domain.  Domain variables that are used to capture signals
	* <b> Data Type </b> – Character
	* <b> Values </b>
	* Time
	* Frequency 

3.	Acceleration Type. The sensor acceleration signal type
	* <b> Data Type </b> – Character
	* <b> Values </b>
	* Body
	* Gravity
	
4.	Motion.  There are three types of samples  
	* <b> Data Type </b> – Character
	* <b> Values </b>
	* Angular velocity
	* Acceleration
	* Jerk (derivative of acceleration)

5.	Statistics.  The set of variables that are estimated from these signals are: 
	* <b> Data Type </b> – Character
	* <b> Values </b>
	* Mean - Mean value
	* Std - Standard deviation

6.	Axis.  There are separate axis samples 
	* <b> Data Type </b> – Character
	* <b> Values </b>
	* X
	* Y
	* Z
	* 3D (all axis) 

7.	Subject.  This is the same as the original data set with one exception.  Since one requirement was to generate the average of each activity with all subjects, for those entries the value for subject was "All".
	* <b> Data Type </b> – Integer

8.	Mean Value. This an average of the original set per the project instructions.
	* <b> Data Type </b> – Numeric

<b> NOTE: </b> Please refer readme.md file for additional information how this data structure has been constructed/transformed.