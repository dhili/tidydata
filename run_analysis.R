getTidyData <- function(){
	
	require(reshape2)
	
	rawdata <- getRawData()
	
	tidyData <- transformData(rawdata)
	
	meltedData <- melt(tidyData, c("Activity", "Subject", "Domain", "AccelerationType", "Motion", "Statistics", "Axis"), "var")
	meltedData$value <- as.numeric(meltedData$value)
	
	castedData <- dcast(meltedData, Activity + Domain + AccelerationType + Motion + Statistics + Axis + Subject ~ variable, mean, margins="Subject")
	colnames(castedData)[colnames(castedData) == "var"] <- "Average Value"
	castedData
}

reshapeData <- function(Subject, Activity, AccType, Device, Domain, Stats, Axis, Motion, var){
	
	tidyData <- data.frame(Subject= integer(),
                 Activity=character(), 
                 AccelerationType=character(), 
				 Device=character(), 
				 Domain=character(), 
				 Statistics=character(), 
				 Axis=character(), 
				 Motion=character(), 
				 var=numeric(),
				 stringsAsFactors = FALSE) 
	
	rownum=1
	
	for (sub in Subject)
	{
		newrow <- c(Subject[rownum], 
					Activity[rownum], 
					AccType, 
					Device, 
					Domain,
					Stats, 
					Axis, 
					Motion, 
					var[rownum])
		tidyData[rownum,] <- newrow
		rownum <- rownum + 1
	}
	
	tidyData
}

transformData <- function(rawdata) {

	tidyData <- data.frame(Subject= integer(),
                 Activity=character(), 
                 AccelerationType=character(), 
				 Device=character(), 
				 Domain=character(), 
				 Statistics=character(), 
				 Axis=character(), 
				 Motion=character(), 
				 var=numeric()) 

	tBodyAccMeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "X", "Acceleration", rawdata[[2]])
	tBodyAccMeanY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "Y", "Acceleration", rawdata[[3]])
	tBodyAccMeanZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "Z", "Acceleration", rawdata[[4]])
	tidyData <- rbind.data.frame(tidyData,tBodyAccMeanX)
	tidyData <- rbind.data.frame(tidyData,tBodyAccMeanY)
	tidyData <- rbind.data.frame(tidyData,tBodyAccMeanZ)
	
	tBodyAccStdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Std", "X", "Acceleration", rawdata[[5]])
	tBodyAccStdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Std", "Y", "Acceleration", rawdata[[6]])
	tBodyAccStdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Std", "Z", "Acceleration", rawdata[[7]])
	tidyData <- rbind.data.frame(tidyData,tBodyAccStdX)
	tidyData <- rbind.data.frame(tidyData,tBodyAccStdY)
	tidyData <- rbind.data.frame(tidyData,tBodyAccStdZ)
	
	tGravityAccMeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "Mean", "X", "Acceleration", rawdata[[8]])
	tGravityAccMeanY <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "Mean", "Y", "Acceleration", rawdata[[9]])
	tGravityAccMeanZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "Mean", "Z", "Acceleration", rawdata[[10]])
	tidyData <- rbind.data.frame(tidyData,tGravityAccMeanX)
	tidyData <- rbind.data.frame(tidyData,tGravityAccMeanY)
	tidyData <- rbind.data.frame(tidyData,tGravityAccMeanZ)
	
	tGravityAccstdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "std", "X", "Acceleration", rawdata[[11]])
	tGravityAccstdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "std", "Y", "Acceleration", rawdata[[12]])
	tGravityAccstdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "std", "Z", "Acceleration", rawdata[[13]])
	tidyData <- rbind.data.frame(tidyData,tGravityAccstdX)
	tidyData <- rbind.data.frame(tidyData,tGravityAccstdY)
	tidyData <- rbind.data.frame(tidyData,tGravityAccstdZ)
	
	tBodyAccJerkmeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "X", "Jerk", rawdata[[14]])
	tBodyAccJerkmeanY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "Y", "Jerk", rawdata[[15]])
	tBodyAccJerkmeanZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "Z", "Jerk", rawdata[[16]])
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkmeanX)
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkmeanY)
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkmeanZ)
	
	tBodyAccJerkstdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "std", "X", "Jerk", rawdata[[17]])
	tBodyAccJerkstdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "std", "Y", "Jerk", rawdata[[18]])
	tBodyAccJerkstdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "std", "Z", "Jerk", rawdata[[19]])
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkstdX)
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkstdY)
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkstdZ)
	
	tBodyGyromeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "X", "Angular Velocity", rawdata[[20]])
	tBodyGyromeanY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "Y", "Angular Velocity", rawdata[[21]])
	tBodyGyromeanZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "Z", "Angular Velocity", rawdata[[22]])
	tidyData <- rbind.data.frame(tidyData,tBodyGyromeanX)
	tidyData <- rbind.data.frame(tidyData,tBodyGyromeanY)
	tidyData <- rbind.data.frame(tidyData,tBodyGyromeanZ)
	
	tBodyGyrostdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "std", "X", "Angular Velocity", rawdata[[23]])
	tBodyGyrostdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "std", "Y", "Angular Velocity", rawdata[[24]])
	tBodyGyrostdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "std", "Z", "Angular Velocity", rawdata[[25]])
	tidyData <- rbind.data.frame(tidyData,tBodyGyrostdX)
	tidyData <- rbind.data.frame(tidyData,tBodyGyrostdY)
	tidyData <- rbind.data.frame(tidyData,tBodyGyrostdZ)
	
	tBodyGyroJerkmeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "X", "Jerk", rawdata[[26]])
	tBodyGyroJerkmeanY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "Y", "Jerk", rawdata[[27]])
	tBodyGyroJerkmeanZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "Z", "Jerk", rawdata[[28]])
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkmeanX)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkmeanY)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkmeanZ)
	
	tBodyGyroJerkstdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "std", "X", "Jerk", rawdata[[29]])
	tBodyGyroJerkstdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "std", "Y", "Jerk", rawdata[[30]])
	tBodyGyroJerkstdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "std", "Z", "Jerk", rawdata[[31]])
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkstdX)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkstdY)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkstdZ)
	
	tBodyAccMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "3D", "Acceleration", rawdata[[32]])
	tBodyAccMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Std", "3D", "Acceleration", rawdata[[33]])
	tGravityAccMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "Mean", "3D", "Acceleration", rawdata[[34]])
	tGravityAccMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Gravity", "Accelerometer", "Time", "Std", "3D", "Acceleration", rawdata[[35]])       
	tBodyAccJerkMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Mean", "3D", "Jerk", rawdata[[36]])
	tBodyAccJerkMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Time", "Std", "3D", "Jerk", rawdata[[37]])
	tBodyGyroMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "3D", "Angular Velocity", rawdata[[38]])
	tBodyGyroMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Std", "3D", "Angular Velocity", rawdata[[39]]) 
	tBodyGyroJerkMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Mean", "3D", "Jerk", rawdata[[40]])
	tBodyGyroJerkMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Time", "Std", "3D", "Jerk", rawdata[[41]])
	tidyData <- rbind.data.frame(tidyData,tBodyAccMagmean)
	tidyData <- rbind.data.frame(tidyData,tBodyAccMagstd)
	tidyData <- rbind.data.frame(tidyData,tGravityAccMagmean)
	tidyData <- rbind.data.frame(tidyData,tGravityAccMagstd)
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkMagmean)
	tidyData <- rbind.data.frame(tidyData,tBodyAccJerkMagstd)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroMagmean)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroMagstd)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkMagmean)
	tidyData <- rbind.data.frame(tidyData,tBodyGyroJerkMagstd)
	
	fBodyAccmeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "X", "Acceleration", rawdata[[42]])
	a <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "Y", "Acceleration", rawdata[[43]])
	b <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "Z", "Acceleration", rawdata[[44]])
	tidyData <- rbind.data.frame(tidyData,fBodyAccmeanX)
	tidyData <- rbind.data.frame(tidyData,a)
	tidyData <- rbind.data.frame(tidyData,b)
	
	fBodyAccstdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "X", "Acceleration", rawdata[[45]])
	fBodyAccstdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "Y", "Acceleration", rawdata[[46]])
	fBodyAccstdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "Z", "Acceleration", rawdata[[47]])
	tidyData <- rbind.data.frame(tidyData,fBodyAccstdX)
	tidyData <- rbind.data.frame(tidyData,fBodyAccstdY)
	tidyData <- rbind.data.frame(tidyData,fBodyAccstdZ)
	
	fBodyAccJerkmeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "X", "Jerk", rawdata[[48]])
	fBodyAccJerkmeanY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "Y", "Jerk", rawdata[[49]])
	fBodyAccJerkmeanZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "Z", "Jerk", rawdata[[50]])
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkmeanX)
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkmeanY)
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkmeanZ)
	
	fBodyAccJerkstdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "X", "Jerk", rawdata[[51]])
	fBodyAccJerkstdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "Y", "Jerk", rawdata[[52]])
	fBodyAccJerkstdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "Z", "Jerk", rawdata[[53]])
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkmeanX)
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkmeanY)
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkmeanZ)
	
	fBodyGyromeanX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "Mean", "X", "Angular Velocity", rawdata[[54]])
	fBodyGyromeanY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "Mean", "Y", "Angular Velocity", rawdata[[55]])
	fBodyGyromeanZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "Mean", "Z", "Angular Velocity", rawdata[[56]])
	tidyData <- rbind.data.frame(tidyData,fBodyGyromeanX)
	tidyData <- rbind.data.frame(tidyData,fBodyGyromeanY)
	tidyData <- rbind.data.frame(tidyData,fBodyGyromeanZ)
	
	fBodyGyrostdX <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "std", "X", "Angular Velocity", rawdata[[57]])
	fBodyGyrostdY <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "std", "Y", "Angular Velocity", rawdata[[58]])
	fBodyGyrostdZ <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "std", "Z", "Angular Velocity", rawdata[[59]])
	tidyData <- rbind.data.frame(tidyData,fBodyGyrostdX)
	tidyData <- rbind.data.frame(tidyData,fBodyGyrostdY)
	tidyData <- rbind.data.frame(tidyData,fBodyGyrostdZ)
	
	fBodyAccMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "3D", "Acceleration", rawdata[[60]])
	fBodyAccMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "3D", "Acceleration", rawdata[[61]])
	fBodyAccJerkMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Mean", "3D", "Jerk", rawdata[[62]])
	fBodyAccJerkMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Accelerometer", "Frequency", "Std", "3D", "Jerk", rawdata[[63]])
	fBodyGyroMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "Mean", "3D", "Angular Velocity", rawdata[[64]])
	fBodyGyroMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "Std", "3D", "Angular Velocity", rawdata[[65]]) 
	fBodyGyroJerkMagmean <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "Mean", "3D", "Jerk", rawdata[[66]])
	fBodyGyroJerkMagstd <- reshapeData(rawdata$Subject, rawdata$Activity, "Body", "Gyroscope", "Frequency", "Std", "3D", "Jerk", rawdata[[67]])
	tidyData <- rbind.data.frame(tidyData,fBodyAccMagmean)
	tidyData <- rbind.data.frame(tidyData,fBodyAccMagstd)
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkMagmean)
	tidyData <- rbind.data.frame(tidyData,fBodyAccJerkMagstd)
	tidyData <- rbind.data.frame(tidyData,fBodyGyroMagmean)
	tidyData <- rbind.data.frame(tidyData,fBodyGyroMagstd)
	tidyData <- rbind.data.frame(tidyData,fBodyGyroJerkMagmean)
	tidyData <- rbind.data.frame(tidyData,fBodyGyroJerkMagstd)
}

getRawData <- function(){
	
	#Getting features data
	rawdata <- getFeaturesData()
	
	#Adding subject data to rawdata data frame
	rawdata <- cbind.data.frame(rawdata, getSubjectData())
	
	#Adding activity data to rawdata data frame
	rawdata <- cbind.data.frame(rawdata, getActivityData())
	
	#Reading activity labels
	activitylabels <- read.table( "activity_labels.txt", stringsAsFactors = FALSE )

	#Merging activity labels with raw data
	rawdata <- merge(rawdata, activitylabels, by.x="ActivityId", by.y="V1" )
	
	#Specifying activity label column name
	colnames(rawdata)[colnames(rawdata) == "V2"] <- "Activity"
	
	rawdata
}

#This method reads features.txt file to fetch column names
#Filters column names which has text "mean()" or "std()"
#Fetches data from X_train.txt and X_test.txt files
#Joins both test and train data 
getFeaturesData <- function(){

	#Reading features text file
	features <- read.table( getPath("features.txt") )
	meanstdcols <- features[grep("[Ss]td\\(\\)|[Mm]ean\\(\\)", features$V2),]

	#Reading features data from X_train.txt and X_test.txt files
	x_traindata <- read.table( getPath("X_train.txt","train") )
	x_testdata <- read.table( getPath("X_test.txt","test") )
	
	#Joining both test and train features data
	rawdata <- x_traindata[,meanstdcols$V1]
	x_testdata <- x_testdata[,meanstdcols$V1]	
	rawdata <- rbind.data.frame(rawdata,x_testdata)
	
	#specifying column names to data frame
	colnames(rawdata) <- meanstdcols$V2
	
	rawdata
}

getActivityData <- function(folder){

	#Reading activity data
	act_traindata <- read.table( getPath("y_train.txt", "train") )
	act_testdata <- read.table( getPath("y_test.txt", "test") )

	#Adding activity ids data to rawdata data frame
	activityData <- data.frame(ActivityId=c(act_traindata$V1,act_testdata$V1))		
	
	activityData

}

getSubjectData <- function(){

	#Reading subject data
	sub_traindata <- read.table( getPath("subject_train.txt", "train") )
	sub_testdata <- read.table( getPath("subject_test.txt", "test") )
	
	#Joining both train and test data
	subjectData <- data.frame(Subject=c(sub_traindata$V1,sub_testdata$V1))
	
	subjectData
}

getPath <- function(fileName,folder=""){
	
	fullPath = ""
	#checking folder is empty
	if(folder=="")
	{
		#since folder name is empty hence file exists in the working directory
		fullPath = fileName
	}
	else
	{
		#constructing path by joining working directory path, folder and file name
		fullPath = paste(getwd(), "/", folder,"/", fileName, sep="")
	}
	
	fullPath
}