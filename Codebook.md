
This is my Codebook for the Getting and Cleaning Data - Project Assignment
Tom Courtney
May 25, 2014

# Codebook
I chose to use the 3 translation variables and 3 rotation (Gyro) variables by 3 (XYZ) by 2(mean,std) for a total of 12 variables.  As a Mechanical Engineer, I reasoned these variables would be the most basic physics representing the problem of deciphering activity behaviors.

My final tidy data set is named:

    tidyset.csv

Here is a description of each column in tidyset.csv

* Column 1: Subject
            This is the ID of the Test Subject
            
* Column 2: Activity
            These are the six activities from the study
            
Here I show the renaming of these variables to more english friendly variables

* Columns 3-8
1 tBodyAcc-mean()-X         renamed to :    xbodyacceleration_mean
2 tBodyAcc-mean()-Y         renamed to :    ybodyacceleration_mean
3 tBodyAcc-mean()-Z         renamed to :    zbodyacceleration_mean
4 tBodyAcc-std()-X          renamed to :    xbodyacceleration_standarddeviation
5 tBodyAcc-std()-Y          renamed to :    ybodyacceleration_standarddeviation
6 tBodyAcc-std()-Z          renamed to :    zbodyacceleration_standarddeviation

* Columns 9-14
121 tBodyGyro-mean()-X         renamed to :    xbodygyro_mean
122 tBodyGyro-mean()-Y         renamed to :    ybodygyro_mean
123 tBodyGyro-mean()-Z         renamed to :    zbodygyro_mean
124 tBodyGyro-std()-X          renamed to :    xbodygyro_standarddeviation
125 tBodyGyro-std()-Y          renamed to :    ybodygyro_standarddeviation
126 tBodyGyro-std()-Z          renamed to :    zbodygyro_standarddeviation 

#End of Codebook