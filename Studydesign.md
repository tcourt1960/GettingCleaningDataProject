#Study Design

Tom Courtney
May 25, 2014

This Study Design provides a listing of the steps used to complete the Project Assignment.
Please note, many of these steps are also documented directly within the run_analysis.R file.

Read in training and test data
Read in training and test activity codes
Read in Activity Labels
Read in features
REad in Subjects files for both test and training

Modify Features headings (V1, V2...) with their Feature names for test and training datatables
Test and traing data now has headings
Bind Subject to features and put into test_data_all and train_data_all. 
Rename column Subject
Add activity names next to each activity code. Relabel columns
Create a new column with descriptive words for Activities
Bind Activty codes and Activity names to complete test and training tables with all info

Finally, row bind the training and test complete dataframe
Combined_data all the data now in one big dat frame!

Select columns that include mean or standard deviation data for XYZ Translation and XYA rotation data
Increment column ids by 3 because I added three columns for Activity Code, Activity and Subject variables
Put back in columns 1:3 
Selected_data now includes only columns with "mean" or "std" in column variable name.

Get rid of Activity COde, it's no longer needed.
Relabel variables with descriptive names.

Extract means by activity and subject using melt and then dcast functions. 

Output the final file "Tidyset.csv"


